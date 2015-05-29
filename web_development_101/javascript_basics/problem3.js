/* Project Euler: Problem 3 http://projecteuler.net/problem=3
Largest prime factor of the number 600851475143 */

n = 600851475143;


function LargestPrimeFactor (num) {
    //
    var ceiling;
    var floor;
    var primeNums = [2];
    this.num = num;
    
    this.largestPrimeFactor = function() {
        
        for (var i = 3; i < (this.num/3)+1; i += 2) {
            if (this.num % i === 0) {
                ceiling = this.num/i + 1;
                floor = i;
                break;
            }
        }
        if (!ceiling) {return this.num;}
        var q = Math.floor(Math.sqrt(ceiling));

        for (var j = 3; j < q; j+= 2) {
            if (isPrime(j)) { primeNums.push(j); }
        }
        
        for (var k = floor; k < ceiling; k += 2) {
            if (this.num % k === 0){
                if (isPrime(this.num/k)) {  return this.num/k; }
            }
        }
    }
    
    function isPrime(n) {
        var ceiling = Math.floor(Math.sqrt(n));
        
        for (var i in primeNums){
            if (primeNums[i] > ceiling) { return true; }
            if (n % primeNums[i] === 0) { return false; }
        }
        return true;
    }
}

var start = new Date().getTime();
var primeFactor = new LargestPrimeFactor(600851475143);
console.log("Largest prime factor: " + primeFactor.largestPrimeFactor());
var end = new Date().getTime();
console.log('Runtime: ' + (end - start)/1000.0 + 'sec');

/*
Largest prime factor: 6857
Runtime: 17.847sec
*/