import QtQuick 2.0
import "../assets"

Item {
    Grid {
        id: buttons
        spacing: 1
        columns: 5
        rows: 7

        width: parent.width
        height: parent.height

        property double buttonWidth: (parent.width - 4) / 5
        property double buttonHeight: (parent.height - 6) / 7
        KeyBrdBtn { id: btn2nd; text: "2nd";onClicked: Calculator.twond(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDeg; text: "deg"; onClicked: Calculator.deg(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnSin; text: "sin"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnCos; text: "cos"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnTan; text: "tan"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnPower; text: "^"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnLg; text: "lg"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnLn; text: "ln"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnBracketFirst; text: "("; onClicked: Calculator.doOperation('('); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnBracketSecond; text: ")"; onClicked: Calculator.doOperation(')'); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnRoot; text: "√"; onClicked: Calculator.doOperation('root'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnAC; text: "AC";onClicked: Calculator.ac(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnC; text: "C"; onClicked: Calculator.del(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDiv; text: "\u00F7"; onClicked: Calculator.doOperation('/'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnMult; text: "*"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnFactorial; text: "!"; onClicked: Calculator.doOperation('!'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn1; text: "1"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn2; text: "2"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn3; text: "3"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnMinus; text: "-"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnODX; text: "1/X"; onClicked: Calculator.doOperation('1/X'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn4; text: "4"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn5; text: "5"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn6; text: "6"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnPlus; text: "+"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnPi; text: "π"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn7; text: "7"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn8; text: "8"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn9; text: "9"; onClicked: Calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        Item {id: equalBtnSpace; width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnExp; text: "e"; onClicked: Calculator.doOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
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
