import QtQuick 2.0
import Sailfish.Silica 1.0
import "../assets"

import "../../js/Calculator.js" as Calculator

Page {
    id: page1
    allowedOrientations: Orientation.All
    PageHeader {
        id: header
        title: qsTr("History")

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
    }
    Label{
        id: noHistory
        visible: history.length=0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: Theme.secondaryHighlightColor
        font.pixelSize: Theme.fontSizeLarge
        text: qsTr("No data yet")
    }
    SilicaListView {
        id:list
        PullDownMenu {
            MenuItem {
                text: qsTr("Clear history")
                onClicked: clearHistory()
            }
        }
        visible: Calculator.countOfOperations!==0
        width: parent.width;
        height: parent.height
        model: ListModel {
           id: historyModel
           ListElement { name: "test1"; value: "history" }
        }
        header: PageHeader{ title: qsTr("History") }
        delegate: Item {
            width: parent.width
            height: Theme.itemSizeMedium
            Label {
                text: value
                font.pixelSize: Theme.fontSizeMedium
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    pageStack.navigateBack({value: Calculator.parseValue(list.model.get(index).value)});
                }
            }
        }
    }
        Component.onCompleted: {
            Calculator.setDisplay(displayP)
            displayP.update(Calculator.stringExpression, Calculator.result)

            history.push("\n"+"expression"+"\n");
            console.log("hist = "+history.length)
            console.log(" c l = "+history.length+" "+Calculator.getLength());
//            for(var i=0;i<history.length;i++) {
//                console.log("h= "+history[i]);
//                var element = { "value" : qsTr("%1").arg(history[i]) }
//                historyModel.append(element)
//            }
        }

//    function clearHistory(){
//        page.history.countOfOperations = 0;
//        page.history.history = [];
//        page.history.clearHistory();
//    }
}


