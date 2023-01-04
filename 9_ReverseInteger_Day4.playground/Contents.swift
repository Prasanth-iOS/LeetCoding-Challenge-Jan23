//MARK: - Reverse Integer

// Link: https://leetcode.com/problems/reverse-integer/
// Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
// Assume the environment does not allow you to store 64-bit integers (signed or unsigned).


//MARK: - Approach

//1. Maintain result initialized to '0' to hold the reverse integer.
//2. Iterate the number until it becomes zero and do the math operations as follows,
    //2.1. Check the result for integer overflow. It should be greater than Int32.max and less than Int32.min to continue, else return 0
    //2.2. Use '% 10' to reversely iterate through digits of the number, use '* 10' to update the result accordingly, and use '/ 10' to update the number.
//3. Return result.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        var num = x, result = 0
        while num != 0 {
            if (result > Int(Int32.max) / 10) || (result < Int(Int32.min) / 10) {
                return 0
            }
            result = (result * 10) + (num % 10)
            num = num / 10
        }
        return result
    }
}

//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = 123
solution.reverse(input1) // 321

//2.
var input2 = -123
solution.reverse(input2) // -321

//3.
var input3 = 120
solution.reverse(input3) // 21

//4.
var input4 = 1563847412 // 2147483647
solution.reverse(input4) // 0
