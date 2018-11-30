import QtQuick 2.0
import Sailfish.Silica 1.0

Column {
    id: display
    height: 400
    spacing: Theme.paddingLarge

    property string expression: ''
    property string result: ''

    function update(expr, res){
        setExpression(expr)
        setResult(res)
    }
    function setResult(res){display.result = res}
    function setExpression(expr){display.expression = expr}

    TextArea {
        id: expression
        height: parent.height / 2
        readOnly: true
        text: qsTr("%1").arg(display.expression)
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
        height: parent.height / 2
        readOnly: true
        text: qsTr("= %1").arg(display.result)
        color: Theme.primaryColor
        font.pixelSize: Theme.fontSizeExtraLarge
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.horizontalPageMargin
        }

    }
}
