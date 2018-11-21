import QtQuick 2.0
import Sailfish.Silica 1.0

Column {
    spacing: Theme.paddingLarge

    TextField {
        id: result
        readOnly: true
        text: qsTr("%1").arg('Expression')
        color: Theme.primaryColor
        font.pixelSize: Theme.fontSizeSmall
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.horizontalPageMargin
        }

    }
    TextArea {
        id: equation
        readOnly: true
        text: qsTr("f(x)=%1").arg("<Expression>")
        color: Theme.primaryColor
        font.pixelSize: Theme.fontSizeLarge
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.horizontalPageMargin
        }

    }
}
