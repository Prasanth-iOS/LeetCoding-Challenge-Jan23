//MARK: - Decode Ways

// Link: https://leetcode.com/problems/decode-ways/
// Given a string s containing only digits, return the number of ways to decode it.


//MARK: - Approach

//1. Using Dynamic Programming, iterate through string and find number of ways by dp[i] = dp[i-1] + dp[i-2].


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func numDecodings(_ s: String) -> Int {
        var sChars = [Character](s)
        guard sChars[0] != "0" else {
            return 0
        }
        var dp1 = 1
        var dp2 = 1
        for i in 2..<s.count + 1 {
            var dp = 0
            if sChars[i-1] != "0" {
                dp += dp1
            }
            if sChars[i-2] == "1" || (sChars[i-2] == "2" && (sChars[i-1] >= "0" && sChars[i-1] <= "6")) {
                dp += dp2
            }
            // Move
            // dp2 dp1 dp
            //     dp2 dp1
            dp2 = dp1
            dp1 = dp
        }
        return dp1
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = "12"
solution.numDecodings(input1) // 2

//2.
var input2 = "226"
solution.numDecodings(input2) // 3

//3.
var input3 = "06"
solution.numDecodings(input3) // 0

//4.
var input4 = "1"
solution.numDecodings(input4) // 1
