import QtQuick 2.0
import Sailfish.Silica 1.0

MouseArea {
    id: area

    property string text: '<Value>'
    property bool isEnable: true
    property bool textBig: false
    Rectangle {
        id:button
        width: parent.width
        height: parent.height
        color: {
            area.pressed ? Theme.rgba(Theme.highlightBackgroundColor,
                          Theme.highlightBackgroundOpacity) :
        Theme.rgba(Theme.secondaryColor,
                          Theme.highlightBackgroundOpacity);


            if(isEnable==false) Theme.rgba(Theme.secondaryColor,
                                    0.25)
        }


        Text {
            text: area.text
            anchors.centerIn: parent
            color: {
                if(isEnable==true)
                    Theme.primaryColor;
                else Theme.rgba(Theme.secondaryColor,0.2)
            }
            horizontalAlignment:Text.AlignHCenter
            font.pixelSize: textBig==false?Theme.fontSizeLarge:Theme.fontSizeSmall

        }
    }
    enabled: isEnable
}
