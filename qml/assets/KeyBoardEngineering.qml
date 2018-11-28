import QtQuick 2.0
import "../assets"

Item {
    id: keyboard

    property var calculator

    Grid {
        id: buttons
        spacing: 1
        columns: 5
        rows: 7

        width: parent.width
        height: parent.height

        property double buttonWidth: (parent.width - 4) / 5
        property double buttonHeight: (parent.height - 6) / 7
        KeyBrdBtn { id: btn2nd; text: "^2"; onClicked: keyboard.calculator.power('2'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDeg; text: "deg"; onClicked: keyboard.calculator.deg(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnSin; text: "sin"; onClicked: keyboard.calculator.prefixOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnCos; text: "cos"; onClicked: keyboard.calculator.prefixOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnTan; text: "tan"; onClicked: keyboard.calculator.prefixOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnPower; text: "^"; onClicked: keyboard.calculator.power('1'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnLg; text: "lg"; onClicked: keyboard.calculator.prefixOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnLn; text: "ln"; onClicked: keyboard.calculator.prefixOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnBracketFirst; text: "("; onClicked: keyboard.calculator.bracket('('); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnBracketSecond; text: ")"; onClicked: keyboard.calculator.bracket(')'); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnRoot; text: "√"; onClicked: keyboard.calculator.prefixOperation('√'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnAC; text: "AC";onClicked: keyboard.calculator.ac(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnC; text: "C"; onClicked: keyboard.calculator.del(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDiv; text: "\u00F7"; onClicked: keyboard.calculator.operation('/'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnMult; text: "*"; onClicked: keyboard.calculator.operation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnFactorial; text: "!"; onClicked: keyboard.calculator.factorial(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn1; text: "1"; onClicked: keyboard.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn2; text: "2"; onClicked: keyboard.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn3; text: "3"; onClicked: keyboard.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnMinus; text: "-"; onClicked: keyboard.calculator.operation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnODX; text: "1/X"; onClicked: keyboard.calculator.power('-1'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn4; text: "4"; onClicked: keyboard.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn5; text: "5"; onClicked: keyboard.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn6; text: "6"; onClicked: keyboard.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnPlus; text: "+"; onClicked: keyboard.calculator.operation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnPi; text: "π"; onClicked: keyboard.calculator.constant(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn7; text: "7"; onClicked: keyboard.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn8; text: "8"; onClicked: keyboard.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn9; text: "9"; onClicked: keyboard.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        Item {id: equalBtnSpace; width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnExp; text: "e"; onClicked: keyboard.calculator.constant(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnPercent; text: "%"; onClicked: keyboard.calculator.percent(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn0; text: "0"; onClicked: keyboard.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDot; text: "."; onClicked: keyboard.calculator.dot(); width: buttons.buttonWidth; height: buttons.buttonHeight}
    }
    KeyBrdBtn { id: btnEqual; text: "="; onClicked: keyboard.calculator.calcResult(); width: buttons.buttonWidth; height: buttons.buttonHeight * 2
        anchors {
            right: buttons.right
            bottom: buttons.bottom
        }
    }
}
