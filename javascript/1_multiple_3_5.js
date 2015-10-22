// Usage: babel-node filename.js
// ES6 syntax

var original = limit => {
  let list = Array.from(Array(limit).keys());
  let multiple_filter = n => {
    return (n % 3 === 0) || (n % 5 === 0);	
  };
  return list.filter(multiple_filter).reduce((a,b) => a + b);
}

var start = new Date().getTime();
var result = original(1000);
var end = new Date().getTime();
console.log(`Result: ${result} in ${end - start} milliseconds`);