import QtQuick 2.0
import "../assets"

Item {
    id: keyboard

    Grid {
        id: buttons
        spacing: 1
        columns: 5
        rows: 7

        width: parent.width
        height: parent.height

        property double buttonWidth: (parent.width - 4) / 5
        property double buttonHeight: (parent.height - 6) / 7
        KeyBrdBtn { id: btn2nd; text: "^2"; onClicked: app.calculator.power('2'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDeg; text: "deg"; onClicked: app.calculator.deg(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnSin; text: "sin"; onClicked: app.calculator.prefixOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnCos; text: "cos"; onClicked: app.calculator.prefixOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnTan; text: "tan"; onClicked: app.calculator.prefixOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnPower; text: "^"; onClicked: app.calculator.power('1'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnLg; text: "lg"; onClicked: app.calculator.prefixOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnLn; text: "ln"; onClicked: app.calculator.prefixOperation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnBracketFirst; text: "("; onClicked: app.calculator.bracket('('); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnBracketSecond; text: ")"; onClicked: app.calculator.bracket(')'); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnRoot; text: "√"; onClicked: app.calculator.prefixOperation('√'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnAC; text: "AC";onClicked: app.calculator.ac(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnC; text: "C"; onClicked: app.calculator.del(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDiv; text: "\u00F7"; onClicked: app.calculator.operation('/'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnMult; text: "*"; onClicked: app.calculator.operation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnFactorial; text: "!"; onClicked: app.calculator.factorial(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn1; text: "1"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn2; text: "2"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn3; text: "3"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnMinus; text: "-"; onClicked: app.calculator.operation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnODX; text: "1/X"; onClicked: app.calculator.power('-1'); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn4; text: "4"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn5; text: "5"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn6; text: "6"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnPlus; text: "+"; onClicked: app.calculator.operation(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnPi; text: "π"; onClicked: app.calculator.constant(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn7; text: "7"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn8; text: "8"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn9; text: "9"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        Item {id: equalBtnSpace; width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnExp; text: "e"; onClicked: app.calculator.constant(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnPercent; text: "%"; onClicked: app.calculator.percent(); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btn0; text: "0"; onClicked: app.calculator.inputNum(this.text); width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn { id: btnDot; text: "."; onClicked: app.calculator.dot(); width: buttons.buttonWidth; height: buttons.buttonHeight}
    }
    KeyBrdBtn { id: btnEqual; text: "="; onClicked: app.calculator.calcResult(); width: buttons.buttonWidth; height: buttons.buttonHeight * 2
        anchors {
            right: buttons.right
            bottom: buttons.bottom
        }
    }
}
