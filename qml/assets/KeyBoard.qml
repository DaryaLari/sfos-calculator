import QtQuick 2.0
import "../assets"

Item {
    Grid {
        id: buttons
        spacing: 0
        columns: 4
        rows: 5

        width: parent.width
        height: parent.height

        property double buttonWidth: parent.width / 4
        property double buttonHeight: parent.height / 5


        KeyBrdBtn { id: btnAC; text: "AC";onClicked: Calculator.ac(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnC; text: "C"; onClicked: Calculator.del(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDiv; text: "\u00F7"; onClicked: Calculator.doOperation('/'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnMult; text: "*"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn1; text: "1"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn2; text: "2"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn3; text: "3"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnMinus; text: "-"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn4; text: "4"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn5; text: "5"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn6; text: "6"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnPlus; text: "+"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn7; text: "7"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn8; text: "8"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn9; text: "9"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        Item {id: equalBtnSpace; width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnPercent; text: "%"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn0; text: "0"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDot; text: "."; onClicked: Calculator.dot(); width: buttons.buttonWidth; height: buttons.buttonHeight}
    }
    KeyBrdBtn { id: btnEqual; text: "="; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight * 2
        anchors {
            right: buttons.right
            bottom: buttons.bottom
        }
    }
}
