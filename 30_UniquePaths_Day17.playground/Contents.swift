//MARK: - Unique Paths

// Link: https://leetcode.com/problems/unique-paths/
// There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.
// Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.
// The test cases are generated so that the answer will be less than or equal to 2 * 109.


//MARK: - Approach

//1. Maintain a result array initialized to 1. Starting at (1,1), add the top and left values(result[i-1][j] + result[i][j-1]) to calculate unique paths to current index.
//2. Return result.


//MARK: - Complexity

//- Time complexity:
// O(n^2)
//
//- Space complexity:
// O(n^2)


//MARK: - Code

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var result = Array(repeating: Array(repeating: 1, count: n), count: m)
        for i in 1..<m {
            for j in 1..<n {
                result[i][j] = result[i-1][j] + result[i][j-1]
            }
        }
        return result[m-1][n-1]
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. m = 3, n = 7
solution.uniquePaths(3, 7) // 28

//2. m = 3, n = 2
solution.uniquePaths(3, 2) // 3

//3. m = 1, n = 1
solution.uniquePaths(1, 1) // [[1]]
