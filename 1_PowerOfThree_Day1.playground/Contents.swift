//MARK: - Power of Three

// Link: https://leetcode.com/problems/power-of-three/
// Given an integer n, return true if it is a power of three. Otherwise, return false.


//MARK: - Approach

//1. Iterate through the number until it is greater than or equal to 3. On each iteration, divide the number by 3, when the remainder is not '0' return false.
//2. Return true, if the number is '1' after the loop completes.


//MARK: - Complexity

//- Time complexity:
// O(log n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        var num = n
        while num >= 3 {
            if num % 3 != 0 {
                return false
            }
            num /= 3
        }
        return num == 1
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = 27
solution.isPowerOfThree(input1) // true

//2.
var input2 = 0
solution.isPowerOfThree(input2) // false

//3.
var input3 = -1
solution.isPowerOfThree(input3) // false

//4.
var input4 = 12
solution.isPowerOfThree(input4) // false

//4.
var input5 = 2187
solution.isPowerOfThree(input5) // true
