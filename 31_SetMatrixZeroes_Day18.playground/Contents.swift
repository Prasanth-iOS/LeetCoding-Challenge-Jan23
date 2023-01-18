//MARK: - Set Matrix Zeroes

// Link: https://leetcode.com/problems/set-matrix-zeroes/
// Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.


//MARK: - Approach

//1. Flag the indexes of first row and column to '0' for the respective iterated index and go through it to set the entire row or column to zero.
//2. Note to keep a seperate flag variable each for first row and column to iterate and set zeros on it individually.


//MARK: - Complexity

//- Time complexity:
// O(n^2)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var m = matrix.count, n = matrix[0].count
        var x = 1, y = 1
        
        for i in 0..<m where matrix[i][0] == 0 {
            y = 0
            break
        }
        for j in 0..<n where matrix[0][j] == 0 {
            x = 0
            break
        }
        
        for i in 1..<m {
            for j in 1..<n {
                if matrix[i][j] == 0 {
                    matrix[0][j] = 0
                    matrix[i][0] = 0
                }
            }
        }
        
        for j in 1..<n {
            if matrix[0][j] == 0 {
                for i in 1..<m {
                    matrix[i][j] = 0
                }
            }
        }
        
        for i in 1..<m {
            if matrix[i][0] == 0 {
                for j in 1..<n {
                    matrix[i][j] = 0
                }
            }
        }
        
        if x == 0 {
            for j in 0..<n {
                matrix[0][j] = 0
            }
        }
        if y == 0 {
            for i in 0..<m {
                matrix[i][0] = 0
            }
        }
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [[1,3],[2,6],[8,10],[15,18]]
solution.merge(input1) // [[1,6],[8,10],[15,18]]

//2.
var input2 = [[1,4],[4,5]]
solution.merge(input2) // [[1,5]]

//3.
var input3 = [[1,4],[0,0]]
solution.merge(input3) // [[0, 0], [1, 4]]
