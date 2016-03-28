// To use Generators: compile with `tsc -target ES6 2_even_fibo.ts`
// Then run with `node --harmony 2_even_fibo.js`
'use strict';
var start, end, result;

let evenFiboProc = (limit: number): number => {
    let sum = 0;
    let a = 1;
    let b = 1;
    let next;

    while(b < limit) {
	if(b % 2 === 0) { sum += b; }
        next = b + a;
        a = b;
        b = next;
    }
    return sum;
};

function *fibonacci(limit: number) {
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
start  = new Date().getTime();
result = evenFiboProc(4000000); 
end    = new Date().getTime();
console.log(`Result: ${result} in ${end - start} ms`);

console.log('Using JS generators, more functional');
result = 0;
start  = new Date().getTime();

for(let n of seq) {
    if(n % 2 === 0) { result += n; }
}

end = new Date().getTime();
console.log(`Result: ${result} in ${end - start} ms`);
