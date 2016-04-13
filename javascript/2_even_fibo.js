// To use Generators: compile with `tsc -target ES6 2_even_fibo.ts`
// Then run with `node --harmony 2_even_fibo.js`
'use strict';
var start, diff, result;
let evenFiboProc = (limit) => {
    let sum = 0;
    let a = 1;
    let b = 1;
    let next;
    while (b < limit) {
        if (b % 2 === 0) {
            sum += b;
        }
        next = b + a;
        a = b;
        b = next;
    }
    return sum;
};
function* fibonacci(limit) {
    let a = 1;
    let b = 1;
    let next;
    while (b < limit) {
        yield b;
        next = b + a;
        a = b;
        b = next;
    }
}
var seq = fibonacci(4000000);
console.log('Procedural implementation');
start = process.hrtime();
result = evenFiboProc(4000000);
diff = process.hrtime(start);
console.log(`Result: ${result} in ${diff[1] / 1000} microsecs`);
console.log('Using JS generators, more functional');
result = 0;
start = process.hrtime();
for (let n of seq) {
    if (n % 2 === 0) {
        result += n;
    }
}
diff = process.hrtime(start);
console.log(`Result: ${result} in ${diff[1] / 1000} microsecs`);
