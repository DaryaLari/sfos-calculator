import QtQuick 2.2
import Sailfish.Silica 1.0
import "../assets"
Page {
    id: page

    objectName: "BasicModePage"
    allowedOrientations: Orientation.All
    anchors.fill: parent

    SilicaListView{
        anchors.fill: parent
        contentHeight: page.height
        Menu{}
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
        }
    }
    Component.onCompleted: {
        app.calculator.setDisplay(displayP)
        displayP.update(app.calculator.stringExpression, app.calculator.result)
    }
}
