//MARK: - Divide Two Integers

// Link: https://leetcode.com/problems/divide-two-integers/
// Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator.


//MARK: - Approach

//1. Using Bit operations, subtract the dividend with divisor.
//2. Iterate until dividend <= divisor, with divisor multipled by '2' for each iteration.
//3. Return the number of subtractions as result.


//MARK: - Complexity

//- Time complexity:
// O(logn)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let isPositive = (dividend >= 0) == (divisor >= 0)
        var dividend = abs(dividend), divisor = abs(divisor), quotient = 0, INTMAX = Int(Int32.max)

        while dividend >= divisor {
            var count = 0
            while dividend >= (divisor << count) {
                count += 1
            }
            quotient += (1 << (count - 1))
            dividend -= divisor << (count - 1)
        }

        if isPositive {
            if quotient > INTMAX {
                quotient = INTMAX
            }
        } else {
            quotient *= -1
        }
        return quotient
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. dividend = 10, divisor = 3
solution.divide(10, 3) // 3

//2. dividend = 7, divisor = -3
solution.divide(7, -3) // -2

//3. dividend = -2147483648, divisor = -1
solution.divide(-2147483648, -1) // 2147483647
