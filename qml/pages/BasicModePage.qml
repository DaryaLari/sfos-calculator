import QtQuick 2.2
import Sailfish.Silica 1.0
import "../assets"

Page {
    id: page

    allowedOrientations: Orientation.All
    anchors.fill: parent

    SilicaListView{
        anchors.fill: parent
        contentHeight: page.height
        PullDownMenu{
            MenuItem{
                text: qsTr("History")
                onClicked: pageStack.push(Qt.resolvedUrl("EngineeringModePage.qml"));
            }
        }
    }

    PageHeader {
        id: header
        title: qsTr("Basic Mode")

        anchors {
            left: parent.top
            right: parent.bottom
            top: parent.right
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

        KeyBoard {
            width: parent.width
            height: parent.height - displayP.height
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
}
