import QtQuick 2.0
import Sailfish.Silica 1.0
import "../assets"
Column {
    id:display
    height: 400
    spacing: Theme.paddingLarge
    property  string expression: ''
    property  string  result: ''
    function update(expr, res){
        setExpression(expr)
        setResult(res)
    }
    function setResult(res){display.result = res}
    function setExpression(expr){display.expression = expr}
//    function appendExpression(letter){display.expression += letter}
//    function delLastExpressionLetters(n){display.expression = display.expression.substring(0, display.expression.length - 1 - n)}
//    function clearExpression(){display.expression = ''}


    TextArea {
        id: equation
            height: parent.height / 2
            width: parent.width
        readOnly: true
        text: qsTr("f(x)=%1").arg(display.expression)
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
         width: parent.width
         height: parent.height / 2

        text: qsTr("f(x)=%1").arg(display.expression)
        color: Theme.primaryColor
        font.pixelSize: Theme.fontSizeMedium
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.horizontalPageMargin
        }

    }
}
