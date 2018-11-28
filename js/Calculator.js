var stringExpression = '0'
var result = ''
var isDecimal = false // current number has dot already
//var isDeg = true // degrees, else radians

var bracketsOpened = 0

var display = null

function setDisplay(d){
    display = d
}

//function Node() {
//    this.value = null
//    this.left = null
//    this.right = null
//    this.parent = null
//}
//var expressionTree = new Node()
//var currentNode = expressionTree

function deg(){
//    isDeg = !isDeg
    if(result !== '' || stringExpression === '0'){
        stringExpression = 'deg('
        result = ''
        bracketsOpened ++
    }
    else{
        if('+-*/('.indexOf(stringExpression.slice(-1)) !== -1){
            stringExpression += 'deg('
            bracketsOpened ++
        }
    }
    display.update(stringExpression, result)
}

function inputNum(number){
    if(result !== ''){
        stringExpression = number
        result = ''
    }
    else{
        if(stringExpression === '0')
            stringExpression = number
        else{
            if('%!)'.indexOf(stringExpression.slice(-1)) === -1)
                stringExpression += number
        }
    }
    display.update(stringExpression, result)
}

function constant(c){
    if(result !== ''){
        stringExpression = c
        result = ''
    }
    else{
        if(stringExpression === '0')
            stringExpression = c
        else{
            if('+-*/^('.indexOf(stringExpression.slice(-1)) !== -1)
                stringExpression += c
        }
    }
    display.update(stringExpression, result)
}

function power(p){
    if(result !== ''){
        stringExpression = '(' + result + ')^'
        if(p !== '1')
            stringExpression += '(' + p + ')'
        result = ''
    }
    else{
        if('0123456789)%!'.indexOf(stringExpression.slice(-1)) != -1){ // ends with number
            stringExpression += '^'
            if(p !== '1')
                stringExpression += '(' + p + ')'
            isDecimal = false
        }
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
        if('+-'.indexOf(op) != -1 && stringExpression === '0'){
            stringExpression = op
        }
        else{
            if('0123456789)%'.indexOf(stringExpression.slice(-1)) != -1){
                stringExpression += op
                isDecimal = false
            }
            else{
                if('+-*/.'.indexOf(stringExpression.slice(-1)) != -1){ // ends with operator
                    stringExpression = stringExpression.replace(/.$/, op) // replace last char to op
                    isDecimal = false
                }
                else{
                    if('(' === stringExpression.slice(-1) && '+-'.indexOf(op) !== -1){ // + or - after opened bracket
                        stringExpression += op
                        isDecimal = false
                    }
                }
            }
        }
    }
    display.update(stringExpression, result)
}

function prefixOperation(op){
    if(result !== '' || stringExpression === '0'){
        stringExpression = op + '('
        result = ''
        bracketsOpened ++
    }
    else{
        if('(+-*/^'.indexOf(stringExpression.slice(-1)) != -1){
            stringExpression += op + '('
            isDecimal = false
            bracketsOpened ++
        }
    }
    display.update(stringExpression, result)
}

function percent(){
    if(result !== ''){
        stringExpression = result + '%'
        result = ''
    }
    else{
        if('0123456789()'.indexOf(stringExpression.slice(-1)) != -1){
            stringExpression += '%'
            isDecimal = false
        }
    }
    display.update(stringExpression, result)
}

function bracket(br){
    if((result !== '' || stringExpression === '0') && br === '('){
        stringExpression = '('
        result = ''
        bracketsOpened = 1
    }
    else{
        if('+-*/(^'.indexOf(stringExpression.slice(-1)) != -1// ends with operator
                && br === '('){
            stringExpression += '('
            bracketsOpened ++
        }
        else
            if('0123456789πe)'.indexOf(stringExpression.slice(-1)) != -1
                    && br === ')' && bracketsOpened > 0){
                stringExpression += ')'
                bracketsOpened --
            }
    }
    display.update(stringExpression, result)
}

function del(){
    if('0123456789πe)+-*/%!^.'.indexOf(stringExpression.slice(-1)) != -1){
        if(stringExpression.slice(-1) === ')')
            bracketsOpened ++
        stringExpression = stringExpression.slice(0, -1)
    }
    else{
        if(stringExpression.slice(-4) === 'sin(' ||
           stringExpression.slice(-4) === 'cos(' ||
           stringExpression.slice(-4) === 'tan(' ||
           stringExpression.slice(-4) === 'deg('
        ){
            stringExpression = stringExpression.slice(0, -4)
            bracketsOpened --
        }
        else if(stringExpression.slice(-3) === 'lg(' ||
           stringExpression.slice(-3) === 'ln('
        ){
            stringExpression = stringExpression.slice(0, -3)
            bracketsOpened --
        }
        else if(stringExpression.slice(-2) === '√('){
            stringExpression = stringExpression.slice(0, -2)
            bracketsOpened --
        }
        else{
            if(stringExpression.slice(-1) === '(')
                bracketsOpened --
            stringExpression = stringExpression.slice(0, -1)
        }
    }
    if(stringExpression === '')
        stringExpression = '0'
    display.update(stringExpression, result)
}

function ac(){
    stringExpression = '0'
    display.update(stringExpression, result)
}

function factorial(){
    if(result !== ''){
        stringExpression = result + '!'
        result = ''
    }
    else{
        if('0123456789)'.indexOf(stringExpression.slice(-1)) != -1){
                stringExpression += '!'
        }
    }
    display.update(stringExpression, result)
}

function calcFactorial(num){
    var val = 1
    var n = parseInt(eval(num))
    for (var i = 2; i <= n; i++)
        val *= i
    return val
}

function factorialToFunction(expr){
    while(expr.indexOf('!') !== -1){
        var index = expr.indexOf('!')
        if(expr[index - 1] !== ')'){ // extract previous number
            var i = index
            while(i - 1 > -1 && '0123456789.'.indexOf(expr[i - 1]) !== -1)
                i--
            expr = (i === 0 ? '' : expr.slice(0, i)) + 'calcFactorial(' + expr.slice(i, index) + ')' + expr.slice(index + 1)
        }
        else{
            var i = index - 1
            var closedBrackets = 1
            while(closedBrackets !== 0){
                i --
                if(expr[i] === ')')
                    closedBrackets ++
                if(expr[i] === '(')
                    closedBrackets --
            }
            while(/[a-zA-Z.]/.test(expr[i])) // check function
                i--
            expr = (i === 0 ? '' : expr.slice(0, i)) + 'calcFactorial' + expr.slice(i, index) + expr.slice(index + 1)
        }
        console.log(expr)
    }
    return expr
}

function powerToFunction(expr){
    var closedBrackets, i
    while(expr.indexOf('^') !== -1){
        var index = expr.indexOf('^')
        var left = expr.slice(0, index)
        var right = expr.slice(index + 1)
        if(left[index - 1] !== ')'){ // extract previous number
            var i = index
            while(i - 1 > -1 && '0123456789.'.indexOf(left[i - 1]) !== -1)
                i--
            left =(i === 0 ? '' : left.slice(0, i)) + 'Math.pow(' + left.slice(i, index) + ','
        }
        else{
            i = index - 1
            closedBrackets = 1
            while(closedBrackets !== 0){
                i --
                if(expr[i] === ')')
                    closedBrackets ++
                if(expr[i] === '(')
                    closedBrackets --
            }
            while(i-1 > -1 && /[a-zA-Z.]/.test(expr[i-1])) // check function
                i--
            left =(i === 0 ? '' : left.slice(0, i)) + 'Math.pow(' + left.slice(i, index - 1) + '),'
        }
        if(right[0] !== '('){ // extract next number
            i = 0
            while(i < right.length && '0123456789.'.indexOf(right[i]) !== -1)
                i ++
            right = right.slice(0, i) + ')' + right.slice(i)
        }
        else{
            right = right.slice(1)
        }
        expr = left + right
        console.log(expr)
    }
    return expr
}

function calcResult(){
    while('('.indexOf(stringExpression.slice(-1)) !== -1){
        stringExpression = stringExpression.slice(0, -1)
        bracketsOpened --
    }

    if('+-*/.'.indexOf(stringExpression.slice(-1)) != -1){ // ends with operator
        stringExpression = stringExpression.slice(0, -1)
    }
    for(bracketsOpened; bracketsOpened > 0; bracketsOpened--)
        stringExpression += ')'
    bracketsOpened = 0
    isDecimal = false
    var expr = stringExpression
    expr = expr.replace('deg', '(Math.PI / 180)*')
    expr = expr.replace('%', '*0.01')
    expr = expr.replace('π', 'Math.PI')
    expr = expr.replace('e', 'Math.E')
    expr = expr.replace('ln', 'Math.log')
    expr = expr.replace('lg', 'Math.log10')
    expr = expr.replace('√', 'Math.sqrt')
    expr = expr.replace('sin', 'Math.sin')
    expr = expr.replace('cos', 'Math.cos')
    expr = expr.replace('tan', 'Math.tan')

    expr = factorialToFunction(expr)
    expr = powerToFunction(expr)

    console.log(expr)
    result = eval(expr)
    display.update(stringExpression, result)
}

