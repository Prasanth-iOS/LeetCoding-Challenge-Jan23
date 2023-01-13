//MARK: - Pow(x, n)

// Link: https://leetcode.com/problems/powx-n/
// Implement pow(x, n), which calculates x raised to the power n (i.e., xn).


//MARK: - Approach

//1. Using recursion, multiply the result of pow(n / 2) by itself to reduce half of the iterations.
//2. If the power is negative, return (1 / result).


//MARK: - Complexity

//- Time complexity:
// O(logn)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var result = myPowHelper(x, n)
        return (n >= 0) ? result : (1 / result)
    }

    private func myPowHelper(_ x: Double, _ n: Int) -> Double {
        if x == 0 {
            return 0
        }
        if n == 0 {
            return 1
        }
        var result = myPowHelper(x, n / 2)
        result *= result
        return (n % 2 != 0) ? (x * result) : result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. x = 2.00000, n = 10
solution.myPow(2.00000, 10) // 1024

//2. x = 2.10000, n = 3
solution.myPow(2.10000, 3) // 9.26100

//3.
solution.myPow(2.00000, -2) // 2-2 = 1/22 = 1/4 = 0.25

//4.
solution.myPow(2.00000, 0) // 1

//5.
solution.myPow(0, 5) // 0
