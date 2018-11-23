var stringExpression = '0'
var result = ''
var isDecimal = false // current number has dot already

var display = null

function setDisplay(d){
    display = d
}

function Node() {
    this.value = null
    this.left = null
    this.right = null
    this.parent = null
}
var expressionTree = new Node()
var currentNode = expressionTree

function inputNum(number){
    if(result !== ''){
        stringExpression = number
        result = ''
    }
    else{
        if(stringExpression === '0')
            stringExpression = number
        else
            stringExpression += number
    }
    display.update(stringExpression, result)
}

function dot(){
    if(result !== ''){
        stringExpression = '0.'
        result = ''
    }
    else{
        if('0123456789'.indexOf(stringExpression.slice(-1)) != -1 && !isDecimal){ // ends with digit
            stringExpression += '.'
            isDecimal = true
        }
        else
            if('+-*/'.indexOf(stringExpression.slice(-1)) != -1){ // ends with operator
                stringExpression += '0.'
                isDecimal = true
            }
    }
    display.update(stringExpression, result)
}

function operation(op){
    if(result !== ''){
        stringExpression = result + op
        result = ''
    }
    else{
        if('0123456789()'.indexOf(stringExpression.slice(-1)) != -1){
            stringExpression += op
            isDecimal = false
        }
        else
            if('+-*/.'.indexOf(stringExpression.slice(-1)) != -1){ // ends with operator
                stringExpression = stringExpression.replace(/.$/, op) // replace last char to op
                isDecimal = false
            }
    }
    display.update(stringExpression, result)
}

function del(){
    stringExpression = stringExpression.slice(0, -1)
    display.update(stringExpression, result)
}

function ac(){
    stringExpression = '0'
    display.update(stringExpression, result)
}

function calcResult(){
    if('+-*/.'.indexOf(stringExpression.slice(-1)) != -1){ // ends with operator
        stringExpression = stringExpression.slice(0, -1) // replace last char to op
    }
    isDecimal = false
    var expr = stringExpression
//    while(!/^(\d+(.\d+)?)$/.test(expr)){
//        expr = expr.replace(/(\d+(.\d+)?)/, function(match) {return eval(match)})
//    }

    result = eval(expr)
    display.update(stringExpression, result)
}

