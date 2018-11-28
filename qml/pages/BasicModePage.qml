import QtQuick 2.2
import Sailfish.Silica 1.0
import "../assets"
import "../../js/Calculator.js" as Calculator

Page {
    id: page

    allowedOrientations: Orientation.All
    anchors.fill: parent

    SilicaListView{
        anchors.fill: parent
        contentHeight: page.height
        PullDownMenu{
            MenuItem{
                text: qsTr("Engineering mode")
                onClicked: pageStack.push(Qt.resolvedUrl("EngineeringModePage.qml"));
            }
            MenuItem{
                text: qsTr("Build a graph")
                onClicked: pageStack.push(Qt.resolvedUrl("GraphBuilder.qml"));
            }
            MenuItem{
                text: qsTr("History")
                onClicked: pageStack.push(Qt.resolvedUrl("History.qml"));
            }
        }
    }

    PageHeader {
        id: header
        title: qsTr("Basic Mode")

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
    }

    Column {
        visible: isPortrait
        width: parent.width
        height: parent.height - header.height
        anchors.top: header.bottom


        Display {
            id: displayP
            width: parent.width
        }

        KeyBoardBasic {
            width: parent.width
            height: parent.height - displayP.height
            calculator: Calculator
//            onButtonClicked: function(btn) {
//                page.calculator.inputNum(btn)
//                displayP.update(page.calculator.stringExpression, page.calculator.result)
//            }
        }
    }

//    Row {
//        visible: isLandscape

//        width: parent.width
//        height: parent.height - header.height
//        anchors.top: header.bottom

//        Display {
//            id: displayL
//            width: parseInt(parent.width)
//        }

//        KeyBoard {
//            width: parseInt(parent.width)
//            height: parent.height
//        }
//    }
    Component.onCompleted: {
        Calculator.setDisplay(displayP)
        displayP.update(Calculator.stringExpression, Calculator.result)
    }
}
