// Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
// Example:
// Input: 38
// Output: 2
// Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only one digit, return it.

// * 1. Recursion
let add_digits = function(num) {
  return num >= 10 ?
    add_digits(num.toString().split('').reduce((a, c) => a + +c, 0)) : num ;
}

// * 2. O(1) way:
// function add_digits(num) {
//   return num && (num % 9 || 9)
// }

console.log(add_digits(38));  // 2
console.log(add_digits(101)); // 2
console.log(add_digits(22));  // 4