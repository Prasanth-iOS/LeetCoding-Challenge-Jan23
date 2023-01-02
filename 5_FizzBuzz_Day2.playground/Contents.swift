//MARK: - Fizz Buzz

// Link: https://leetcode.com/problems/fizz-buzz/
// Given an integer n, return a string array answer (1-indexed) where:
//answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
//answer[i] == "Fizz" if i is divisible by 3.
//answer[i] == "Buzz" if i is divisible by 5.
//answer[i] == i (as a string) if none of the above conditions are true.


//MARK: - Approach

//1. Maintain result string array. Iterate from 1 to n, check each number as below,
    //1.1 If remainder of the number divided by 15 is '0', then append "FizzBuzz" to result.
    //1.2 Else if remainder of the number divided by 3 is '0', then append "Fizz" to result.
    //1.1 Else if remainder of the number divided by 5 is '0', then append "Buzz" to result.
    //1.1 Else, append the number as string.
//2. Return result.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var result = [String]()
        for i in 1...n {
            if (i % 15 == 0) {
                result.append("FizzBuzz")
            } else if (i % 3 == 0) {
                result.append("Fizz")
            } else if (i % 5 == 0) {
                result.append("Buzz")
            } else {
                result.append("\(i)")
            }
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = 3
solution.fizzBuzz(input1) // ["1","2","Fizz"]

//2.
var input2 = 5
solution.fizzBuzz(input2) // ["1","2","Fizz","4","Buzz"]

//3.
var input3 = 15
solution.fizzBuzz(input3) // ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]
