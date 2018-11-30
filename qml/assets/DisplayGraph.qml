//import QtQuick 2.0
//import Sailfish.Silica 1.0
//import "../assets"
//Column {
//    id:display
//    height: 400
//    spacing: Theme.paddingLarge
//    property  string expression: ''
//    property  string  result: ''
//    function update(expr, res){
//        setExpression(expr)
//        setResult(res)
//    }
//    function setResult(res){display.result = res}
//    function setExpression(expr){
//        if(expr==="0")display.expression = "";else display.expression = expr;
//    console.log("display expression: "+expr+" bool: "+(expr==="0"))
//    }
////    function appendExpression(letter){display.expression += letter}
////    function delLastExpressionLetters(n){display.expression = display.expression.substring(0, display.expression.length - 1 - n)}
////    function clearExpression(){display.expression = ''}


//    TextArea {
//        id: equation
//            height: parent.height / 2
//            width: parent.width
//        readOnly: true
//        text: qsTr("%1").arg("Expression")
//        color: Theme.primaryColor
//        font.pixelSize: Theme.fontSizeMedium
//        anchors {
//            left: parent.left
//            right: parent.right
//            margins: Theme.horizontalPageMargin
//        }

//    }

//    TextField {
//        id: result
//        readOnly: true
//         width: parent.width
//         height: parent.height / 2

//        text: qsTr("f(x)=%1").arg(display.expression)
//        color: Theme.primaryColor
//        font.pixelSize: Theme.fontSizeMedium
//        anchors {
//            left: parent.left
//            right: parent.right
//            margins: Theme.horizontalPageMargin
//        }

//    }
//}



import QtQuick.Controls 2.2
import QtQuick 2.6

ApplicationWindow {
    visible: true; width: 720; height: 1280

    Rectangle {
        anchors { horizontalCenter: parent.horizontalCenter;
            verticalCenter: parent.verticalCenter}
        id: rectangle
        property string buttonText: "Click me"
        property color color: "blue"
        property color textColor: "white"

        property color pressedColor: "darkblue"
        property color dimmedColor: "grey"
        property int fontSize: 40
        property int paddingSize: 30
        property int borderRadius: 10
        state:"RELESEAD"
        signal clicked()
        signal released()
        signal pressed()
        signal pressAndHold()
        color:color
        radius: borderRadius
        //        padding: paddingSize
        Text {
            id:text
            anchors.centerIn: parent

            text: rectangle.buttonText
            font {pixelSize:rectangle.fontSize}
            color: rectangle.textColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            hoverEnabled: true
            anchors.fill: rectangle
            onClicked: {
                rectangle.clicked()
            }
            onPressed: {rectangle.state = "PRESSED";rectangle.pressed()}

            onReleased:{
                text.text=rectangle.buttonText;
                rectangle.released();
                rectangle.state = "RELEASED"
            }

            onPressAndHold:{
                text.text='Press and Hold';
                rectangle.pressAndHold();
                rectangle.state = "PRESSEDANDHOLD"
            }

        }
        states: [
            State {
                name: "PRESSED"
                PropertyChanges { target: rectangle; color: rectangle.pressedColor}
            },
            State {
                name: "RELEASED"
                PropertyChanges { target: rectangle; color: rectangle.color}
            },
            State {
                name: "RELEASEDANDHOLD"
                PropertyChanges { target: rectangle; color: rectangle.color}
            }
        ]
        transitions: [
            Transition {
                from: "PRESSED"
                to: "RELEASED"
                ColorAnimation { target: rectangle; duration: 500}
            },
            Transition {
                from: "RELEASED"
                to: "PRESSED"
                ColorAnimation { target: rectangle; duration: 500}
            }
            ,
            Transition {
                from: "PRESSED"
                to: "PRESSEDANDHOLD"
                ColorAnimation { target: rectangle; duration: 500}
            },
            Transition {
                from: "PRESSEDANDHOLD"
                to: "RELEASED"
                ColorAnimation { target: rectangle; duration: 500}
            }
        ]

    }
}

