// The difference between Iteration and Recursion.
// Iteration

function factorial(n) {
  var answer = 1; // 0!

  for (var loop = 1; loop <= n; loop++) {
    answer = answer * loop; // (n-1)! * n
  }
  return answer;
}

var times = 4;
var result = factorial(times);

console.log(`The iteration result of factorial(${times}) is: ${result}`);

//
// Recursion
//

function factorial2(n) {
  if (n == 0) {
    return 1;
  } else {
    return n * factorial2(n - 1);
  }
}

result = factorial2(times);

console.log(`The iteration result of factorial2(${times}) is: ${result}`);
