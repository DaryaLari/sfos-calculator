var stringExpression = '0'
var result = ''
var isDecimal = false // current number has dot already

function countBracket(br){
    var count = 0
    for(var i = 0; i < stringExpression.length; i++){
        if(stringExpression[i] === br)
         count ++
    }
    return count
}

var display = null

function setDisplay(d){
    display = d
}

function deg(){
//    isDeg = !isDeg
    if(result !== '' || stringExpression === '0'){
        stringExpression = 'deg('
        result = ''
    }
    else{
        if('+-*/('.indexOf(stringExpression.slice(-1)) !== -1){
            stringExpression += 'deg('
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

function inputNum1(number){
    if(result !== ''){

        stringExpression = number
        result = ''
    }
    else{
        if(stringExpression === '0')
            stringExpression = number
        else{
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
        if('0123456789)%!eπ'.indexOf(stringExpression.slice(-1)) != -1){ // ends with number
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
        if('0123456789'.indexOf(stringExpression.slice(-1)) != -1 /*&& !isDecimal*/){ // ends with digit
            var i = stringExpression.length - 1
            while(i > -1 && '0123456789'.indexOf(stringExpression[i]) !== -1)
                i --
            if(i < 0 || (i > -1 && stringExpression[i] != '.')) // not decimal number yet
                stringExpression += '.'
//            isDecimal = true
        }

        else
            if('+-*/'.indexOf(stringExpression.slice(-1)) != -1){ // ends with operator
                stringExpression += '0.'
//                isDecimal = true
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
            if('0123456789)%!eπ'.indexOf(stringExpression.slice(-1)) != -1){
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
    }
    else{
        if('(+-*/^'.indexOf(stringExpression.slice(-1)) != -1){
            stringExpression += op + '('
            isDecimal = false
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
    }
    else{
        if('+-*/(^'.indexOf(stringExpression.slice(-1)) != -1 && br === '('){
            stringExpression += '('
        }
        else
            if('0123456789πe)'.indexOf(stringExpression.slice(-1)) != -1 && br === ')' && ((countBracket('(') - countBracket(')')) > 0)){
                stringExpression += ')'
            }
    }
    display.update(stringExpression, result)
}

function del(){
    if('0123456789πe)+-*/%!^.'.indexOf(stringExpression.slice(-1)) != -1){
        stringExpression = stringExpression.slice(0, -1)
    }
    else{
        if(stringExpression.slice(-4) === 'sin(' ||
           stringExpression.slice(-4) === 'cos(' ||
           stringExpression.slice(-4) === 'tan(' ||
           stringExpression.slice(-4) === 'deg('
        ){
            stringExpression = stringExpression.slice(0, -4)
        }
        else if(stringExpression.slice(-3) === 'lg(' ||
           stringExpression.slice(-3) === 'ln('
        ){
            stringExpression = stringExpression.slice(0, -3)
        }
        else if(stringExpression.slice(-2) === '√('){
            stringExpression = stringExpression.slice(0, -2)
        }
        else{
            stringExpression = stringExpression.slice(0, -1)
        }
    }
    if(stringExpression === '')
        stringExpression = '0'
    display.update(stringExpression, result)
}

function delPart(part){
    stringExpression = stringExpression.slice(0, -part.length)
    display.update(stringExpression, result)
}

function ac(){
    stringExpression = '0'
    result = '0'
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
    }

    if('+-*/.'.indexOf(stringExpression.slice(-1)) != -1){ // ends with operator
        stringExpression = stringExpression.slice(0, -1)
    }
    while((countBracket('(') - countBracket(')')) > 0)
        stringExpression += ')'
    isDecimal = false
    var expr = stringExpression
    expr = expr.replace(/deg/g, '(Math.PI / 180)*')
    expr = expr.replace(/%/g, '*0.01')
    expr = expr.replace(/π/g, 'Math.PI')
    expr = expr.replace(/e/g, 'Math.E')
    expr = expr.replace(/ln/g, 'Math.log')
    expr = expr.replace(/lg/g, 'Math.log10')
    expr = expr.replace(/√/g, 'Math.sqrt')
    expr = expr.replace(/sin/g, 'Math.sin')
    expr = expr.replace(/cos/g, 'Math.cos')
    expr = expr.replace(/tan/g, 'Math.tan')

    try{
        expr = factorialToFunction(expr)
        expr = powerToFunction(expr)

        console.log(expr)
        result = eval(expr)

    }catch(error){
        console.log(error)
        result = 'unknown error'
    }
    display.update(stringExpression, result)


    app.history.append({expression: stringExpression, result: result});
}
