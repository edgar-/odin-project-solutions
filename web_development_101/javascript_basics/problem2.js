
/* Project Euler: Problem 2 http://projecteuler.net/problem=2
By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms. */

var prev = 1;
var curr = 2;
var sumEven = 0;

while (curr < 4000000) {
   
   if (curr % 2 === 0) {
       sumEven += curr;
   }

   curr += prev;
   prev = curr - prev;
}

console.log("Sum of even Fibonacci Numbers: " + sumEven);
/*
Sum of even Fibonacci Numbers: 4613732
*/
