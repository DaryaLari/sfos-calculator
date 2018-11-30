import QtQuick 2.0
import "../assets"
import "../pages"
Item {
    id: keyBoard
//    signal buttonClicked(string btn)

    Grid {
        id: buttons
        spacing: 1
        columns: 4
        rows: 5

        width: parent.width
        height: parent.height

        property double buttonWidth: (parent.width - 3) / 4
        property double buttonHeight: (parent.height - 4) / 5


        KeyBrdBtn { id: btnAC; text: "AC";onClicked: app.calculator.ac(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnC; text: "C"; onClicked: app.calculator.del(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDiv; text: "\u00F7"; onClicked: app.calculator.operation('/'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnMult; text: "*"; onClicked: app.calculator.operation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn1; text: "1"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn2; text: "2"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn3; text: "3"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnMinus; text: "-"; onClicked: app.calculator.operation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn4; text: "4"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn5; text: "5"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn6; text: "6"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnPlus; text: "+"; onClicked: app.calculator.operation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn7; text: "7"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn8; text: "8"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn9; text: "9"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        Item {id: equalBtnSpace; width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnPercent; text: "%"; onClicked: app.calculator.percent(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn0; text: "0"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDot; text: "."; onClicked: app.calculator.dot(); width: buttons.buttonWidth; height: buttons.buttonHeight}
    }
    KeyBrdBtn { id: btnEqual; text: "="; onClicked: {app.calculator.calcResult();console.log("his len = "+history.length)} width: buttons.buttonWidth; height: buttons.buttonHeight * 2 + 1
        anchors {

            right: buttons.right
            bottom: buttons.bottom
        }
    }

}
