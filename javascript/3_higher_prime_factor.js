'use strict';
var start, diff, result;
function* primeGenerator(limit) {
    let iteration = 1;
    let prime = 2;
    let step = 0;
    while ((prime + step) < limit) {
        if (iteration == 1) {
            prime = 2;
        }
        else if (iteration == 2) {
            prime = 3;
        }
        else if (iteration == 3) {
            prime = 5;
            step = 2;
        }
        else {
            prime += step;
            step = 6 - step;
        }
        if ((prime == 5) || (prime === 7) || (prime % 5 !== 0) && (prime % 7 !== 0)) {
            yield prime;
        }
        iteration += 1;
    }
}
console.log('test displaying the prime numbers until 50');
var test_prime = primeGenerator(50);
for (let n of test_prime) {
    console.log(n);
}
let max_prime_factor = (value) => {
    let rest = value;
    let breakpoint = Math.floor(Math.sqrt(value));
    let prime_gen = primeGenerator(Infinity);
    let prime = prime_gen.next().value;
    while (rest > breakpoint) {
        while (rest % prime !== 0) {
            prime = prime_gen.next().value;
        }
        rest = Math.floor(rest / prime);
    }
    return rest;
};
console.log('Procedural implementation');
start = process.hrtime();
result = max_prime_factor(600851475143);
diff = process.hrtime(start);
console.log(`Result: ${result} in ${diff[0]} s ${diff[1] / 1000 / 1000} ms`);
