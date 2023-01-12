//MARK: - Rotate Image

// Link: https://leetcode.com/problems/rotate-image/
// You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).


//MARK: - Approach

//1. Maintain left and right indexes initialized to 0 and array's length - 1. And top and bottom indexes initialized to left and right respectively.
//2. Rotate the outer index from top to right to bottom to left by,
    //2.1. Iterate through the rows looping left until right index,
        //2.1.1. Then add another loop with i initialized to '0' until right - left to go over each column.


//MARK: - Complexity

//- Time complexity:
// O(n^2)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var left = 0, right = matrix.count - 1
        
        while left < right {
            for i in 0..<right - left {
                var top = left, bottom = right
                
                let topLeft = matrix[top][left + i]
                matrix[top][left + i] = matrix[bottom - i][left]
                matrix[bottom - i][left] = matrix[bottom][right - i]
                matrix[bottom][right - i] = matrix[top + i][right]
                matrix[top + i][right] = topLeft
            }
            left += 1
            right -= 1
        }
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [[1,2,3],[4,5,6],[7,8,9]]
solution.rotate(&input1) // [[7,4,1],[8,5,2],[9,6,3]]

//2.
var input2 = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
solution.rotate(&input2) // [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

//3.
var input3 = [[2,29,20,26,16,28],[12,27,9,25,13,21],[32,33,32,2,28,14],[13,14,32,27,22,26],[33,1,20,7,21,7],[4,24,1,6,32,34]]
solution.rotate(&input3) // [[4,33,13,32,12,2],[24,1,14,33,27,29],[1,20,32,32,9,20],[6,7,27,2,25,26],[32,21,22,28,13,16],[34,7,26,14,21,28]]
