import QtQuick 2.0
import Sailfish.Silica 1.0

Column {
    spacing: Theme.paddingLarge

    TextArea {
        id: equation
        readOnly: true
        text: qsTr("%1").arg("<Equation>")
        color: Theme.primaryColor
        font.pixelSize: Theme.fontSizeMedium
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.horizontalPageMargin
        }

    }

    TextField {
        id: result
        readOnly: true
        text: qsTr("= %1").arg('<Result>')
        color: Theme.primaryColor
        font.pixelSize: Theme.fontSizeExtraLarge
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.horizontalPageMargin
        }

    }
}
