//MARK: - Valid Sudoku

// Link: https://leetcode.com/problems/valid-sudoku/
// Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
// Each row must contain the digits 1-9 without repetition.
// Each column must contain the digits 1-9 without repetition.
// Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.


//MARK: - Approach

//1. Maintain unique set each for row, coloumn and sub box(3 * 3).
//2. Iterate through each element in the 9*9 board and check the element is available in any of the unique sets other than ".",
    //2.1. If it is available, then it is a duplicate, return false.
    //2.2 If not found, add it to the each unique set to make sure to find the duplicate in further iterations.
//3. When loop completes successfully, return true.


//MARK: - Complexity

//- Time complexity:
// O(n^2)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let len = 9
        var rowSet = Array(repeating: Set<Character>(), count: len)
        var colSet = Array(repeating: Set<Character>(), count: len)
        var boxSet = Array(repeating: Set<Character>(), count: len)

        for r in 0..<len {
            for c in 0..<len {
                let currentChar = board[r][c]
                if currentChar == "." {
                    continue
                }
                let boxIdx = (3 * (r / 3)) + (c / 3)
                if rowSet[r].contains(currentChar)
                || colSet[c].contains(currentChar)
                || boxSet[boxIdx].contains(currentChar) {
                    return false
                }
                rowSet[r].insert(currentChar)
                colSet[c].insert(currentChar)
                boxSet[boxIdx].insert(currentChar)
            }
        }
        return true
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
let input1: [[Character]] = [["5","3",".",".","7",".",".",".","."]
                             ,["6",".",".","1","9","5",".",".","."]
                             ,[".","9","8",".",".",".",".","6","."]
                             ,["8",".",".",".","6",".",".",".","3"]
                             ,["4",".",".","8",".","3",".",".","1"]
                             ,["7",".",".",".","2",".",".",".","6"]
                             ,[".","6",".",".",".",".","2","8","."]
                             ,[".",".",".","4","1","9",".",".","5"]
                             ,[".",".",".",".","8",".",".","7","9"]]
solution.isValidSudoku(input1) // true

//2.
let input2: [[Character]] = [["8","3",".",".","7",".",".",".","."]
                             ,["6",".",".","1","9","5",".",".","."]
                             ,[".","9","8",".",".",".",".","6","."]
                             ,["8",".",".",".","6",".",".",".","3"]
                             ,["4",".",".","8",".","3",".",".","1"]
                             ,["7",".",".",".","2",".",".",".","6"]
                             ,[".","6",".",".",".",".","2","8","."]
                             ,[".",".",".","4","1","9",".",".","5"]
                             ,[".",".",".",".","8",".",".","7","9"]]
solution.isValidSudoku(input2) // false
