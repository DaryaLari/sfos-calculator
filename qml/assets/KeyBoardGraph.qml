import QtQuick 2.0
import "../assets"
import "../../js/states.js" as STATE
import Sailfish.Silica 1.0
Item {
    id: keyBoardGraph
    property string expression: 'y='
    property var expressionParts: []
    property var expressionPartsButtonText: []
    property var operationStack: []
    property var calculator
    property int powerClicks: 0
    property int unclosedBrackets: 0
    Grid {
        id: buttons
        spacing: 1
        columns: 5
        rows: 7

        width: parent.width
        height: parent.height

        property double buttonWidth: parent.width / 5
        property double buttonHeight: parent.height / 7

        KeyBrdBtn {
            id: btnXPow; text: "x^a";
            onClicked:  {

                keyBoardGraph.calculator.inputNum1("x^(");
                 expressionParts.push("Math.pow(x,");
                expressionPartsButtonText.push("x^(");
                unclosedBrackets++;
                 STATE.pushComplexOperation();
                operationStack.push("STATE.pushComplexOperation()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnPow; text: "a^b";
            onClicked:   {

//                btnC.isEnable=false;
                console.log("clicks->"+powerClicks+"<-Clicks");
                powerClicks++;
               if(powerClicks==1){
                   textBig=true;
                   text="start \n degree";
                   keyBoardGraph.calculator.inputNum1("(");
                    expressionParts.push("Math.pow(");
                   expressionPartsButtonText.push("(");
                   STATE.pushComplexOperation();
                   operationStack.push("STATE.pushComplexOperation()");
                   btnBuild.isEnable=false;
                   btnPow.isEnable=false;

               }
               if(powerClicks==2){

                   text="end \n input";
                   keyBoardGraph.calculator.inputNum1(")^(");
                    expressionParts.push(",");
                   expressionPartsButtonText.push(")^(");
                   STATE.pushComplexOperation();
                   operationStack.push("STATE.pushComplexOperation()");
                   btnBuild.isEnable=false;
                   btnPow.isEnable=false;

               }
               if(powerClicks==3){
                   textBig=false;
                   text="a^b";powerClicks=0;
                   keyBoardGraph.calculator.inputNum1(")");
                    expressionParts.push(")");
                   expressionPartsButtonText.push(")");
                   STATE.pushConst();
                   operationStack.push("STATE.pushConst()");
//                   btnBuild.isEnable=true;
               }
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnSin; text: "sin";
            onClicked: {
                keyBoardGraph.calculator.inputNum1(this.text+"(");
                expressionParts.push("Math.sin(");
                expressionPartsButtonText.push(this.text+"(");
                unclosedBrackets++;

                STATE.pushComplexOperation();
                operationStack.push("STATE.pushComplexOperation()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnCos; text: "cos";
            onClicked: {
                keyBoardGraph.calculator.inputNum1(this.text+"(");
                  expressionParts.push("Math.cos(");
                expressionPartsButtonText.push(this.text+"(");
                unclosedBrackets++;

                STATE.pushComplexOperation();
                operationStack.push("STATE.pushComplexOperation()");

            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnTan; text: "tan";
            onClicked: {
                keyBoardGraph.calculator.inputNum1(this.text+"(");
                   expressionParts.push("Math.tan(");
                expressionPartsButtonText.push(this.text+"(");
                unclosedBrackets++;

                STATE.pushComplexOperation();
                operationStack.push("STATE.pushComplexOperation()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnE; text: "e";
            onClicked:  {
                keyBoardGraph.calculator.inputNum1(this.text);
            expressionParts.push("Math.E");
                    expressionPartsButtonText.push(this.text);
                STATE.pushConst();
                 operationStack.push("STATE.pushConst()");
            } width: buttons.buttonWidth; height: buttons.buttonHeight}


        KeyBrdBtn {
            id: btnLg2x; text: "log2(a)";
            textBig:true;
            onClicked: {
                keyBoardGraph.calculator.inputNum1("log2(");
                    expressionParts.push("log2x(");
                expressionPartsButtonText.push("log2(");
                unclosedBrackets++;

                STATE.pushComplexOperation();
                operationStack.push("STATE.pushComplexOperation()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}



        KeyBrdBtn {
            id: btnLn; text: "ln";
            onClicked:  {
                keyBoardGraph.calculator.inputNum1(this.text+"(");
             expressionParts.push("Math.log(");
                expressionPartsButtonText.push(this.text+"(");
                unclosedBrackets++;

                STATE.pushComplexOperation();
                operationStack.push("STATE.pushComplexOperation()");

            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}



        KeyBrdBtn {
            id: btnBracketFirst; text: "(";
            onClicked:  {
                keyBoardGraph.calculator.inputNum1(this.text);
             expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                  unclosedBrackets++;

                STATE.pushComplexOperation();
                operationStack.push("STATE.pushComplexOperation()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnBracketSecond; text: ")";
            onClicked:  {
                if(unclosedBrackets>0)unclosedBrackets--;

                keyBoardGraph.calculator.inputNum1(this.text);
            expressionParts.push(this.text);
                    expressionPartsButtonText.push(this.text);
                  STATE.pushConst();
                 operationStack.push("STATE.pushConst()");
            }
             isEnable: unclosedBrackets>0?true:false;
            width: buttons.buttonWidth; height: buttons.buttonHeight;
        }

        KeyBrdBtn {
            id: btnRoot; text: "√";
            onClicked: {

                keyBoardGraph.calculator.inputNum1(this.text+"(");
              expressionParts.push("Math.sqrt(");
                expressionPartsButtonText.push(this.text+"(");
                unclosedBrackets++;
                STATE.pushComplexOperation();
                operationStack.push("STATE.pushComplexOperation()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}
        KeyBrdBtn {
            id: btnAbs; text: "|a|";
            onClicked: {

                keyBoardGraph.calculator.inputNum1("module(");
              expressionParts.push("Math.abs(");
                expressionPartsButtonText.push("module(");
                unclosedBrackets++;
                STATE.pushComplexOperation();
                operationStack.push("STATE.pushComplexOperation()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnAC; text: "AC";
            onClicked: {
                powerClicks=0;
                btnPow.text="a^b";
//btnC.isEnable=true;
                keyBoardGraph.calculator.ac();
            expression='y=';
                while(expressionParts.length>0)
                expressionParts.pop();

                while(expressionPartsButtonText.length>0)
                    expressionPartsButtonText.pop();

                while(operationStack.length>0)
                    operationStack.pop();

                for(var i=0;i<expressionParts.length;i++){
                    console.log(expressionParts.length+expressionParts[i]);
                }
                unclosedBrackets=0;
                STATE.pushDeleteAll();
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

//        KeyBrdBtn { id: btnC; text: "C"; onClicked:{

//                if(operationStack.length>0)operationStack.pop();
//                if(operationStack.length==0)STATE.pushDeleteAll();
//                eval(operationStack[operationStack.length-1]);
//                if(expressionPartsButtonText.length>0)var popEl=expressionPartsButtonText.pop();
//                              if(expressionParts.length>0){keyBoardGraph.calculator.delPart(popEl);
//                expressionParts.pop();
//                }


//            }width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn { id: btnDiv; text: "\u00F7";
            onClicked:             {
                STATE.pushOperation();
                keyBoardGraph.calculator.inputNum1("/");
                expressionParts.push("/");
                expressionPartsButtonText.push("/");
                 operationStack.push("STATE.pushOperation()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnMult; text: "*";
            onClicked:{
                 STATE.pushOperation();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushOperation()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnFactorial; text: "!";

            onClicked: {

                keyBoardGraph.calculator.inputNum1(this.text+"(");
              expressionParts.push("sFact(");
                expressionPartsButtonText.push(this.text+"(");
                unclosedBrackets++;
                STATE.pushComplexOperation();
                operationStack.push("STATE.pushComplexOperation()");
            }

            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btn1; text: "1";
            onClicked: {
                STATE.pushNumber();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushNumber()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}


        KeyBrdBtn { id: btn2; text: "2";
            onClicked: {
                STATE.pushNumber();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushNumber()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}


        KeyBrdBtn {
            id: btn3; text: "3";
                        onClicked: {
                            STATE.pushNumber();
                            keyBoardGraph.calculator.inputNum1(this.text);
                            expressionParts.push(this.text);
                            expressionPartsButtonText.push(this.text);
                            operationStack.push("STATE.pushNumber()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

            KeyBrdBtn {
            id: btnMinus; text: "-";
            onClicked:  {
                 STATE.pushOperation();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushOperation()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnODX; text: "1/x";
            onClicked:  {
                keyBoardGraph.calculator.inputNum1(this.text);
            expressionParts.push(this.text);
                    expressionPartsButtonText.push(this.text);
                STATE.pushConst()

 operationStack.push("STATE.pushConst()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btn4; text: "4";
            onClicked: {
                STATE.pushNumber();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushNumber()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btn5; text: "5";
            onClicked: {
                STATE.pushNumber();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushNumber()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btn6; text: "6";
            onClicked: {
                STATE.pushNumber();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushNumber()");
            }
        width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnPlus; text: "+";
            onClicked:  {
                STATE.pushOperation();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushOperation()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight
        }


        KeyBrdBtn {
            id: btnPi; text: "π";
            onClicked:  {

            expressionParts.push("Math.PI");
                keyBoardGraph.calculator.inputNum1(this.text);
                    expressionPartsButtonText.push(this.text);
                STATE.pushConst();
                 operationStack.push("STATE.pushConst()");
            } width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btn7; text: "7";
            onClicked: {
                STATE.pushNumber();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushNumber()");
             }
         width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btn8; text: "8";
            onClicked: {
                STATE.pushNumber();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushNumber()");
             }
         width: buttons.buttonWidth; height: buttons.buttonHeight}

         KeyBrdBtn {
            id: btn9; text: "9";
            onClicked: {
                STATE.pushNumber();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushNumber()");
             }
         width: buttons.buttonWidth; height: buttons.buttonHeight}

            KeyBrdBtn {
                id: btnX; text: "x";
                onClicked: {

                    keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                        expressionPartsButtonText.push(this.text);
                    STATE.pushConst();
                    operationStack.push("STATE.pushConst()");
            }width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnExp; text: "e^a";
            onClicked: {
                keyBoardGraph.calculator.inputNum1("e^(");
           expressionParts.push("Math.exp(");
                expressionPartsButtonText.push("e^(");
                unclosedBrackets++;
                  STATE.pushComplexOperation();
                operationStack.push("STATE.pushComplexOperation()");
            } width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnlogTE; text: "log2(e)";
             textBig:true;
            onClicked: {

                keyBoardGraph.calculator.inputNum1("log2(e)");
            expressionParts.push("Math.LOG2E");
                    expressionPartsButtonText.push("log2(e)");
                STATE.pushConst();
                operationStack.push("STATE.pushConst()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btn0; text: "0";
            onClicked:             {
                STATE.pushNumber();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushNumber()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight}

        KeyBrdBtn {
            id: btnDot; text: ".";
            onClicked: {
                STATE.pushDot();
                keyBoardGraph.calculator.inputNum1(this.text);
                expressionParts.push(this.text);
                expressionPartsButtonText.push(this.text);
                operationStack.push("STATE.pushDot()");
            }
            width: buttons.buttonWidth; height: buttons.buttonHeight;}

        KeyBrdBtn {
            id: btnBuild; text: "Build";

            onClicked: {
                for(var i=0;i<expressionParts.length;i++){
                    console.log("Expression parts length = "+expressionParts.length+"expressions="+expressionParts[i]);
                    expression=expression+expressionParts[i];

                }/*
                history.push("\n"+expression+"\n");
                console.log("hist = "+history.length)*/
                app.calculator.graphHistory(expression);
                pageStack.push(Qt.resolvedUrl("../pages/Graph.qml"),{expression1:expression});
                expression="y=";
            }
            isEnable: (unclosedBrackets>0||expressionParts.length==0 ||(keyBoardGraph.powerClicks>0&&keyBoardGraph.powerClicks<3))?false:true;
            width: buttons.buttonWidth; height: buttons.buttonHeight;
        }


    }
}
