import QtQuick 2.0
import Sailfish.Silica 1.0
import "../assets"

Page {
    id: page1
    objectName: "History"

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
    Label{
        id: noHistory
        visible: app.history.count === 0
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
        visible: app.calculator.count!==0
        width: parent.width;
        height: parent.height
        model: app.history
        header: PageHeader{ title: qsTr(" ") }
        delegate: Item {
            width: parent.width
//            height: Theme.itemSizeExtraLarge
height: 2*expr1.height+res.height
            Column{

                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }

                Label {

                    id: expr1
                    width: parent.width
                    text: expression.substring(0, 1)==='u'?expression.substring(1, expression.length):expression
                    font.pixelSize: Theme.fontSizeMedium
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                }
                Label {
                    id:res
                    visible: expression.substring(0, 1)!=='y'
                    width: parent.width
                    text: expression.substring(0, 1)==='u'?' = unknown error':' = ' + result
                    font.pixelSize: Theme.fontSizeLarge   
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


    function clearHistory(){
        app.history.clear()
    }
}
