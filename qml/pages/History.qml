import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
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
}
