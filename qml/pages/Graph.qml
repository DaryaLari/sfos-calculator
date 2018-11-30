import QtQuick 2.0
import Sailfish.Silica 1.0
import "d3.js" as D3
import "../assets"

Page {
    property var expression1

    property int screenCoefficient:parent.height/parent.width
    property var elem:[0,0,1,0,0]
    property int zoomLevel: zoomLevelControl.value
    property var range:[[-1*zoomLevel,(-1)*zoomLevel*screenCoefficient],[zoomLevel,zoomLevel*screenCoefficient]];
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

        width: parent.width
        height: parent.height

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

            //scale for horizontal distances
            var xScale = d3.scaleLinear()
            .range([0, width])
            .domain([minX, maxX]);
            console.log(width+" "+height+" "+minX+" "+maxX);



            //          //scales for vertical distances
            var yScale = d3.scaleLinear()
            .range([height , 0])
            .domain([minY, maxY]);

            //          var line = x(xScale, yScale, context);


            var line = d3.line().x(function (d) {
                return xScale(d[0]);
            }).y(function (d) {
                return yScale(d[1]);
            }).curve(d3.curveCardinal).context(context);

            //properties of graph
            context.beginPath();
            context.lineWidth = 1.5;
            context.strokeStyle = "white";
            context.fillStyle = "white";

            drawXAxis(context);
            drawYAxis(context);

            drawPlot(line);

            context.stroke();
        }
        function plotForm(xScale, yScale, context) {
            return d3.line().x(function (d) {
                return xScale(d[0]);
            }).y(function (d) {
                return yScale(d[1]);
            }).curve(d3.curveLinear)
            .context(context);
        }

        function drawXAxis(context) {
            var sections=range[1][0]*2

            //draw X line
            var xLine = d3.scaleLinear().range([0, height/2]).domain([height/2, 0]);
            var line = plotForm(d3.scaleLinear().range([0, width]).domain([0, width]), xLine, context);
            line([[0, 0], [width, 0]]);

            context.font = '20px sans-serif';

            var sectionSize = width / sections;
            var plotStepSize = (maxX - minX) / sections;
            for (var i = 1; i < sections; i++) {
                line([[sectionSize * i , -height/2],
                      [sectionSize * i , height/2]])
                // Decimal points should be configured with dependency on max - min interval length
                var text = (minX + plotStepSize * i).toFixed(1).toString();
                context.fillText(text, sectionSize * i -
                                 context.measureText(text).width / 2, xLine(25));
            }
        }

        function drawYAxis(context) {
            var sections=range[1][1]*2

            //draw y line
            var yLine = d3.scaleLinear().range([0, height]).domain([height, 0]);
            var line = plotForm(d3.scaleLinear().range([0, width]).domain([0, width]), yLine, context)
            line([[width/2, height], [width/2, 0]]);

            context.font = '20px sans-serif';

            var sectionSize = height/ sections;
            var plotStepSize = (maxY - minY) / sections;
            for (var i = 1; i < sections; i++) {
                line([[0, sectionSize * i],
                      [width, sectionSize * i]])
                // Decimal points should be configured with dependency on max - min interval length
                var text = (minY + plotStepSize * i).toFixed(1).toString();
                context.fillText(text, width/2+20, yLine(sectionSize * i  - 10));
            }
        }


        function drawPlot(line) {
            line(getPoints());

        }
        //factorial
        function sFact(num)
        {
            if(num<0)return "false";
            if(num!==parseInt(num.toString(),10))return "false";
            var rval=1;
            for (var i = 2; i <= num; i++)
                rval = rval * i;
            return rval;
        }

        //expressions1 in degree expression2
        function powOp(a,b){
            return Math.pow(a,b);
        }

        //prevent e+/ e- form
        function toFixed1(x) {
            if (Math.abs(x) < 1.0) {
                var e = parseInt(x.toString().split('e-')[1]);
                if (e) {
                    x *= Math.pow(10,e-1);
                    x = '0.' + (new Array(e)).join('0') + x.toString().substring(2);
                }
            } else {
                var e = parseInt(x.toString().split('+')[1]);
                if (e > 20) {
                    e -= 20;
                    x /= Math.pow(10,e);
                    x += (new Array(e+1)).join('0');
                }
            }
            return x;
        }

        function log2x(x){return Math.log(x)*Math.LOG2E;}
        function getPoints() {
            console.log(expression1);
            var points = [];
            var y;
            var dx = (maxX - minX) / 10;
            dx=0.1;
            for(var x =minX; x <= maxX; x =x+ dx) {
                y = 0;
                var m = Math.pow(10,1);
                x=Math.round(x*m)/m;
                try{
                    eval(expression1);
                }catch(error){
                    mistake=true;
                    break;
                }
                y=toFixed1(y);
                y=Number(y).toFixed(15).replace(/\.?0+$/,"");
                if(!isNaN(y)){
                    if(!(y===-Infinity||y===Infinity)){
                        if(y<=9007199254740991&&y>=-9007199254740991){
                            points.push([x, y]);
                        }

                    }
                }
            }
            if(points.length==0){mistake=true; plot.visible=false;}
            return points;
        }

        Slider {
            id: zoomLevelControl
            minimumValue: 1
            maximumValue: 20
            value: 10
            highlighted: true
            handleVisible: true
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            stepSize: 1
            onSliderValueChanged: {
                range[0][0]=-1*value;
                range[0][1]=(-1)*value*screenCoefficient;
                range[1][0]=value;
                range[1][1]=value*screenCoefficient;
                //    plot.coordsOnPressed =  plot.coordsOnReleased
                plot.requestPaint();
                console.log("poni")}
        }
    }

}
