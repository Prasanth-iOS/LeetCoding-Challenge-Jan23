//MARK: - Generate Parentheses

// Link: https://leetcode.com/problems/generate-parentheses/
// Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.


//MARK: - Approach

//1. Using Depth First Search, backtrack through the given number.
//2. Make sure, open < given number, close < open and append the value when open == close == n.
//3. Return the result.


//MARK: - Complexity

//- Time complexity:
// O(2^n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var combination = ""
        var combinations = [String]()
        
        backTrack(0, 0, n, &combination, &combinations)
        return combinations
    }
    
    private func backTrack(_ openN: Int, _ closeN: Int, _ n: Int, _ combination: inout String, _ combinations: inout [String]) {
        if openN == closeN && closeN == n {
            combinations.append(combination)
            return
        }
        
        if openN < n {
            combination += "("
            backTrack(openN + 1, closeN, n, &combination, &combinations)
            combination.removeLast()
        }
        
        if closeN < openN {
            combination += ")"
            backTrack(openN, closeN + 1, n, &combination, &combinations)
            combination.removeLast()
        }
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = 3
solution.generateParenthesis(input1) // ["((()))", "(()())", "(())()", "()(())", "()()()"]

//2.
var input2 = 1
solution.generateParenthesis(input2) // ["()"]
