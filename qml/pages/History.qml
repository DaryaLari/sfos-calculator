import QtQuick 2.0
import Sailfish.Silica 1.0
import "../assets"

Page {
    id: page1
    objectName: "History"

    allowedOrientations: Orientation.All

//     property var historyAr
    PageHeader {
        id: header
        title: qsTr("History")

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
    }
    Label{
        id: noHistory
        visible: app.history.length === 0
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
        visible: app.calculator.countOfOperations!==0
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
                    pageStack.navigateBack({value: app.calculator.parseValue(list.model.get(index).value)});
                }
            }
        }
    }
        Component.onCompleted: {}
//            app.calculator.setDisplay(displayP)
//            displayP.update(app.calculator.stringExpression, app.calculator.result)

//            history.push("\n"+"expression"+"\n");
//            console.log("hist = "+history.length)

//            console.log(" c l = "+history.length+" "+app.calculator.getLength());
//            for(var i=0;i<history.length;i++) {
//                console.log("h= "+history[i]);
//                var element = { "value" : qsTr("%1").arg(history[i]) }
//                historyModel.append(element)
//            }
//        }

//        function update(){
////            console.log('app', app)
//           console.log("hfghfg= "+ app.history.length, app.history)
//            console.log("model= ", list.model)
//            for(var i=0;i<app.history.length;i++) {
//                console.log("h= "+app.history[i]);
////                var element = { "value" : qsTr("%1").arg(app.history[i]) }
////                app.history.append(element)
//            }
//        }

    function clearHistory(){
//        page.history.countOfOperations = 0;
//        page.history.history = [];
//        page.history.clearHistory();
        app.history.clear()
    }
}
