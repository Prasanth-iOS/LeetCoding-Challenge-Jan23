//MARK: - Spiral Matrix

// Link: https://leetcode.com/problems/spiral-matrix/
// Given an m x n matrix, return all elements of the matrix in spiral order.


//MARK: - Approach

//1. Maintain left and top indexes initialized to 0. And, right and bottom indexes initialized to array's first element count - 1 and array's length - 1 respectively.
//2. Iterate with i from left to right, top to bottom, right to left, and bottom to top, increment the index for the next sequence iteration until left > right or top > bottom.
//3. Append the iterated values to the result.


//MARK: - Complexity

//- Time complexity:
// O(n^2)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()

        guard matrix.count > 0 else {
            return result
        }

        var left = 0, right = matrix[0].count - 1
        var top = 0, bottom = matrix.count - 1

        while true {
            // left to right
            for i in left...right {
                result.append(matrix[top][i])
            }
            top += 1
            if top > bottom {
                break
            }

            // top to bottom
            for i in top...bottom {
                result.append(matrix[i][right])
            }
            right -= 1
            if left > right {
                break
            }

            // right to left
            for i in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][i])
            }
            bottom -= 1
            if top > bottom {
                break
            }

            // bottom to top
            for i in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[i][left])
            }
            left += 1
            if left > right {
                break
            }
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [[1,2,3],[4,5,6],[7,8,9]]
solution.spiralOrder(input1) // [1, 2, 3, 6, 9, 8, 7, 4, 5]

//2.
var input2 = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
solution.spiralOrder(input2) // [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]

//3.
var input3 = [[Int]]()
solution.spiralOrder(input3) // []
