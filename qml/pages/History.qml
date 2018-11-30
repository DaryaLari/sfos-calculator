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
        visible: app.calculator.countOfOperations!==0
        width: parent.width;
        height: parent.height
        model: app.history
        header: PageHeader{ title: qsTr("History") }
        delegate: Item {
            width: parent.width
            height: Theme.itemSizeMedium
            Column{
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                Label {
                    width: parent.width
                    text: expression
                    font.pixelSize: Theme.fontSizeMedium
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }
                Label {
                    width: parent.width
                    text: ' = ' + result
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
