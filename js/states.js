function pushNumber() {

        var bool1=true;

        var bool2=false;


    assignNumbers(true);

        btnDot.isEnable=true;

    assignConst(false);

        btnBracketFirst.isEnable=false;

    assignComplexOperation(false);

        btnPlus.isEnable=bool1;
        btnMinus.isEnable=bool1;
        btnMult.isEnable=bool1;
        btnDiv.isEnable=bool1;

    btnPow.isEnable=(powerClicks==1||powerClicks==2)?true:false;
    }

function pushDot() {
          assignNumbers(true);

        btnDot.isEnable=false;
        btnPi.isEnable=false;
        btnlogTE.isEnable=false;

        btnBracketFirst.isEnable=false;

    assignComplexOperation(false);

        btnPlus.isEnable=false;
        btnMinus.isEnable=false;
        btnMult.isEnable=false;
        btnDiv.isEnable=false;
    btnBuild.isEnable=false;

     btnPow.isEnable=(powerClicks==1||powerClicks==2)?false:true;
    }

function pushConst() {

    var bool1=false;

    var bool2=true;
    assignNumbers(bool1);

    btnDot.isEnable=bool1;

    assignConst(bool1);

    btnBracketFirst.isEnable=false;

    assignComplexOperation(bool1);

    btnPlus.isEnable=bool2;
    btnMinus.isEnable=bool2;
    btnMult.isEnable=bool2;
    btnDiv.isEnable=bool2;
     btnPow.isEnable=(powerClicks==1||powerClicks==2)?true:false;
}

function pushOperation() {

    var bool1=true;

    var bool2=false;

    assignNumbers(bool1);

    btnDot.isEnable=bool2;

    assignConst(bool1);

    btnBracketFirst.isEnable=true;
    btnBracketSecond.isEnable=false;

    assignComplexOperation(bool1);

    btnPlus.isEnable=bool2;
    btnMinus.isEnable=bool2;
    btnMult.isEnable=bool2;
    btnDiv.isEnable=bool2;

    btnBuild.isEnable=false;
     btnPow.isEnable=(powerClicks==1||powerClicks==2)?false:true;
}

function pushComplexOperation() {

    var bool1=true;

    var bool2=false;

    assignNumbers(bool1);

    btnDot.isEnable=bool2;

    assignConst(bool1);

    btnBracketFirst.isEnable=true;

    assignComplexOperation(bool1);

    btnPlus.isEnable=bool2;
    btnMinus.isEnable=bool1;
    btnMult.isEnable=bool2;
    btnDiv.isEnable=bool2;

   btnBracketSecond.isEnable=false;
    btnBuild.isEnable=false;
     btnPow.isEnable=(powerClicks==1||powerClicks==2)?false:true;
}

function pushDeleteAll() {

    var bool1=true;

    var bool2=true;
    assignNumbers(bool1);

    btnDot.isEnable=bool1;
    assignConst(bool1);

    btnBracketFirst.isEnable=bool1;

    assignComplexOperation(bool1);

    btnPlus.isEnable=bool2;
    btnMinus.isEnable=bool2;
    btnMult.isEnable=bool2;
    btnDiv.isEnable=bool2;
}

function assignNumbers(boolTOR){

    console.log("ExpressionPArts="+expressionParts.length+" uncosedBracket="+unclosedBrackets);
    btn0.isEnable=boolTOR;
     btn1.isEnable=boolTOR;
     btn2.isEnable=boolTOR;
     btn3.isEnable=boolTOR;
     btn4.isEnable=boolTOR;
     btn5.isEnable=boolTOR;
     btn6.isEnable=boolTOR;
     btn7.isEnable=boolTOR;
     btn8.isEnable=boolTOR;
     btn9.isEnable=boolTOR;

    btnBracketSecond.isEnable=unclosedBrackets>0?true:false;
    btnBuild.isEnable=(unclosedBrackets>0||expressionParts.length==0 ||(keyBoardGraph.powerClicks>0&&keyBoardGraph.powerClicks<3))?false:true;
}
function assignComplexOperation(boolTOR){
    btnCos.isEnable=boolTOR;
    btnSin.isEnable=boolTOR;
    btnTan.isEnable=boolTOR;
    btnODX.isEnable=boolTOR;
    btnRoot.isEnable=boolTOR;
    btnExp.isEnable=boolTOR;
    btnLn.isEnable=boolTOR;
    btnFactorial.isEnable=boolTOR;
    btnXPow.isEnable=boolTOR;
    btnPow.isEnable=boolTOR;
    btnLg2x.isEnable=boolTOR;
}
function assignConst(boolTOR){
    btnPi.isEnable=boolTOR;
    btnlogTE.isEnable=boolTOR;
    btnE.isEnable=boolTOR;
     btnX.isEnable=boolTOR;

}
