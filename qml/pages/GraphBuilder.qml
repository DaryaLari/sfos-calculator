import QtQuick 2.2
import Sailfish.Silica 1.0
import "../assets"
import "../../js/Calculator.js" as Calculator
Page {
    id: page
    objectName: "GraphBuilder"

    property var calculator: Calculator
    allowedOrientations: Orientation.All
    anchors.fill: parent

    SilicaListView{
        anchors.fill: parent
        contentHeight: page.height
        Menu{}
    }

    PageHeader {
        id: header
        title: qsTr("Graph")

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


        DisplayGraph {
            id: displayP
            width: parent.width
        }

        KeyBoardGraph {
            width: parent.width
            height: parent.height - displayP.height
              calculator: page.calculator
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
        page.calculator.setDisplay(displayP)
        displayP.update(page.calculator.stringExpression, page.calculator.result)
    }
}

