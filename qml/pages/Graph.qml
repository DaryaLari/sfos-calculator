import QtQuick 2.0
import Sailfish.Silica 1.0
import "d3.js" as D3
import "../assets"

Page {
    property var expression1

    property int screenCoefficient:parent.height/parent.width
    property var elem:[0,0,1,0,0]
    property var range:[[-10,-10*screenCoefficient],[10,10*screenCoefficient]];
property bool mistake:false
    property int rootLine:0
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All
//basic
    Label{
        id: emptyLabel
        visible: mistake
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: Theme.secondaryHighlightColor
        font.pixelSize: Theme.fontSizeLarge
        horizontalAlignment:Text.AlignHCenter
            text:qsTr("You may enter \n wrong expression \n or \n system problems")
    }
    Canvas {
        anchors.margins: Theme.horizontalPageMargin
visible: !mistake
        id:plot
        property real minX: range[0][0]
        property real maxX: range[1][0]
        property real minY: range[0][1]
        property real maxY: range[1][1]

        property int leftMargin: 10
        property int bottomMargin: 10


        property var coordsOnPressed
        property var coordsOnReleased
        property var coordsOfMovement


        width: parent.width
        height: parent.height
      // Определение различных свойств

        //graph drawer
      onPaint:{
          var context = plot.getContext('2d');
          context.clearRect(0,0,plot.width,plot.height);

          var xOffset = (range[1][0] - range[0][0]) / 10;
          var yOffset = (range[1][1] - range[0][1]) / 10;
          minX = range[0][0] - xOffset;
          maxX = range[1][0] + xOffset;
          minY = range[0][1] - yOffset;
          maxY = range[1][1] + yOffset;

          //scale X, d3.scaleLinear, which simplify work with scaling of the chart
          var xScale = d3.scaleLinear()
            .range([0, width])
          .domain([minX, maxX]);
          console.log(width+" "+height+" "+minX+" "+maxX);



//          //scales Y, d3.scaleLinear, which simplify work with scaling of the chart
               var yScale = d3.scaleLinear()
          .range([height , 0])
          .domain([minY, maxY]);

//          var line = x(xScale, yScale, context);


          var line = d3.line().x(function (d) {
              return xScale(d[0]);
            }).y(function (d) {
              return yScale(d[1]);
            }).curve(d3.curveNatural).context(context);

          //properties of graph
          context.beginPath();
          context.lineWidth = 1.5;
          context.strokeStyle = "white";
          context.fillStyle = "white";

          //draw plot
//          line([[-width, 0], [width, 0]]);

          drawXAxis(context);
          drawYAxis(context);

          line([[minX, rootLine], [maxX, rootLine]]);
          line([[rootLine, minY], [rootLine, maxY]]);

          drawPlot(line);

          context.stroke();
      }
      function plotForm(xScale, yScale, context) {
          return d3.line().x(function (d) {
              return xScale(d[0]);
          }).y(function (d) {
              return yScale(d[1]);
          }).curve(d3.curveNatural)
          .context(context);
      }

      function drawXAxis(context) {
          var sections=5;

          //draw X line
          var xLine = d3.scaleLinear().range([0, height/2]).domain([height/2, 0]);
          var line = plotForm(d3.scaleLinear().range([0, width]).domain([0, width]), xLine, context);
          line([[0, 0], [width, 0]]);

          context.font = '20px sans-serif';

          var sectionSize = width / sections;
          var plotStepSize = (maxX - minX) / sections;
          for (var i = 1; i < sections; i++) {
              line([[sectionSize * i , -10],
                    [sectionSize * i , 10]])
              // Decimal points should be configured with dependency on max - min interval length
              var text = (minX + plotStepSize * i).toFixed(1).toString();
              context.fillText(text, sectionSize * i -
                               context.measureText(text).width / 2, xLine(25));
          }
      }

      function drawYAxis(context) {
           var sections=10;

          //draw y line
          var yLine = d3.scaleLinear().range([0, height]).domain([height, 0]);
          var line = plotForm(d3.scaleLinear().range([0, width]).domain([0, width]), yLine, context)
          line([[width/2, height], [width/2, 0]]);

          context.font = '20px sans-serif';

          var sectionSize = height/ sections;
          var plotStepSize = (maxY - minY) / sections;
          for (var i = 1; i < sections; i++) {
              line([[width/2-10, sectionSize * i],
                    [width/2+10, sectionSize * i]])
              // Decimal points should be configured with dependency on max - min interval length
              var text = (minY + plotStepSize * i).toFixed(1).toString();
              context.fillText(text, width/2+20, yLine(sectionSize * i  - 10));
          }
      }

      function changeZoomPlus(levelZoom){
          if( range[1][1] - levelZoom > 0 && range[1][0] - levelZoom  > 0 ){
              range[0][0]+=levelZoom;
              range[0][1]+=levelZoom;
              range[1][0]-=levelZoom;
              range[1][1]-=levelZoom;
          }
          plot.requestPaint();
      }

      function changeZoomMinus(levelZoom){
          range[0][0]-=levelZoom;
          range[0][1]-=levelZoom;
          range[1][0]+=levelZoom;
          range[1][1]+=levelZoom;
          plot.requestPaint();
      }

      function roundOfNum(num){
          return Math.round(num * 100) / 100;
      }
      function drawPlot(line) {
          line(getPoints());

      }
      function sFact(num)
      {
          console.log(isNaN("false"));
          if(num<0)return "false";
//          console.log(num+" "+parseInt(num.toString(),10)+"="+(num===parseInt(num.toString(),10)));
          if(num!==parseInt(num.toString(),10))return "false";
          var rval=1;
          for (var i = 2; i <= num; i++)
              rval = rval * i;
          return rval;
      }
      function powOp(a,b){
          return Math.pow(a,b);
      }

      function log2x(x){return Math.log(x)*Math.LOG2E;}
      function getPoints() {
          console.log(expression1);
          var points = [];
          var y;
          var dx = (maxX - minX) / 100;
          dx=0.1;
          for(var x =minX; x <= maxX; x =x+ dx) {
              y = 0;

              var m = Math.pow(10,1);
               x=Math.round(x*m)/m;
//              console.log("x="+x);
//              for (var j = 0; j < 5; j++) {
//                  y += Math.pow(x, j)  * elem[j];
//              }
//              if(x==0)x=0.01


              eval(expression1);

//                y=Math.round(y*m)/m;

console.log("coordinates: x="+x+" y="+y)
              if(!isNaN(y)){
                  if(!(y===-Infinity||y===Infinity)){
                      m = Math.pow(10,10);
                      y=Math.round(y*m)/m;
//                  console.log("coordinates:");
                  console.log("coordinates: x="+x+" y="+y)
//                  console.log("BINGP");
              points.push([x, y]);

                  }
              }
          }
          if(points.length==0){mistake=true; plot.visible=false;}
          console.log(points.length)
          return points;
      }
      Item {
          id:zoom
          anchors.fill: plot
          //processing pinch gesture
        PinchArea{
            id: pinchArea
            property real minScale: 0.5
            property real maxScale: 1.0
            anchors.fill: parent
            pinch.target: zoom
            pinch.minimumScale: minScale * 0.5
            pinch.maximumScale: maxScale * 1.5
            //The commented code below - fire exit
            onPinchFinished: {
                                console.log(zoom.scale)
                                if (zoom.scale <= 1)
                                    plot.changeZoomPlus(Math.round(zoom.scale));
                                else
                                    plot.changeZoomMinus(Math.round(zoom.scale*10));
                zoom.scale = 1;
            }
            onPinchUpdated: {
                if (zoom.scale >= 1)
                    plot.changeZoomPlus(roundOfNum(zoom.scale));
                else
                    plot.changeZoomMinus(roundOfNum(zoom.scale));
            }

            Rectangle {
                opacity: 0.0
                anchors.fill: parent
            }
        }
        //processing moving
        MouseArea {
            id: inputArea
            anchors.fill: parent
            onPressed: {
                plot.coordsOnPressed = [mouse.x,mouse.y];
            }
            onPositionChanged: {
                plot.coordsOnReleased = [mouse.x,mouse.y];
                plot.coordsOfMovement = [Math.round((plot.coordsOnPressed[0]-plot.coordsOnReleased[0])/100),Math.round((plot.coordsOnReleased[1]-plot.coordsOnPressed[1])/100)];
                range[0][0]+=plot.coordsOfMovement[0];
                range[0][1]+=plot.coordsOfMovement[1];
                range[1][0]+=plot.coordsOfMovement[0];
                range[1][1]+=plot.coordsOfMovement[1];
                plot.coordsOnPressed =  plot.coordsOnReleased
                plot.requestPaint();
            }
        }
      }
    }

   }
