import QtQuick 2.0
import Sailfish.Silica 1.0

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
    function setExpression(expr){
        if(expr==="0")display.expression = "";else display.expression = expr;
    console.log("display expression: "+expr+" bool: "+(expr==="0"))
    }

    TextArea {
        id: equation
            height: parent.height / 2
            width: parent.width
        readOnly: true
        text: qsTr("%1").arg("Expression")
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

