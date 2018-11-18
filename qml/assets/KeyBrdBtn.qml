import QtQuick 2.0
import Sailfish.Silica 1.0

MouseArea {
    id: area

    property string text: '<Value>'

    Rectangle {
        width: parent.width
        height: parent.height
        color: area.pressed ? Theme.rgba(Theme.highlightBackgroundColor,
                          Theme.highlightBackgroundOpacity) :
        Theme.rgba(Theme.secondaryColor,
                          Theme.highlightBackgroundOpacity)

        Text {
            text: area.text
            anchors.centerIn: parent
            color: Theme.primaryColor
            font.pixelSize: Theme.fontSizeLarge
        }
    }
}
