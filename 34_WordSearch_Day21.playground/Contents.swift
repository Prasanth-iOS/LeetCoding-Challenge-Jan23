//MARK: - Word Search

// Link: https://leetcode.com/problems/word-search/
// Given an m x n grid of characters board and a string word, return true if word exists in the grid.


//MARK: - Approach

//1. Iterate through each elements in the 2d matrix with i and j, then apply dfs for each element to check if the any of the four paths has the match.
//2. For DFS,
    //2.1 the failure condition is to check if the i and j going out of bounds of the matrix(<0 or >length), or checking the visited element again, or the character didn't match.
    //2.2 the success condition is when the check is for the last character in the word.
    //2.3 if not last character, flag the index as visited and apply dfs again 4 times each for top, right, bottom, left and check if any of these calls has a match. if not, reset the visited index and return false.


//MARK: - Complexity

//- Time complexity:
// O(mn * 4^l) - m and n stand for number of rows and columns respectively, l is the length of the word
//
//- Space complexity:
// O(mn)


//MARK: - Code

import Foundation

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 && board[0].count > 0 else {
            return false
        }
        let m = board.count
        let n = board[0].count
        var visitedChars = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        var wordContent = [Character](word)
        
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == wordContent[0] && dfs(board, wordContent, m, n, i, j, 0, &visitedChars) {
                    return true
                }
            }
        }
        return false
    }

    private func dfs(_ board: [[Character]], _ word: [Character], _ m: Int, _ n: Int, _ i: Int, _ j: Int, _ k: Int, _ visitedChars: inout [[Bool]]) -> Bool {
        if i < 0 || j < 0
        || i == m || j == n
        || visitedChars[i][j] || board[i][j] != word[k] {
            return false
        }

        if k == word.count - 1 {
            return true
        }
    
        visitedChars[i][j] = true

        if (dfs(board, word, m, n, i, j + 1, k + 1, &visitedChars)
        || dfs(board, word, m, n, i, j - 1, k + 1, &visitedChars)
        || dfs(board, word, m, n, i + 1, j, k + 1, &visitedChars)
        || dfs(board, word, m, n, i - 1, j, k + 1, &visitedChars)) {
            return true
        }
        visitedChars[i][j] = false
        return false
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

var board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]

//1. word = "ABCCED"
solution.exist(board, "ABCCED") // true

//2. word = "SEE"
solution.exist(board, "SEE") // true

//3. word = "ABCB"
solution.exist(board, "ABCB") // false
