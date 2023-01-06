//MARK: - Letter Combinations of a Phone Number

// Link: https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/
// Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
// A mapping of digits to letters (just like on the telephone buttons). Note that 1 does not map to any letters.


//MARK: - Approach

//1. Using Depth First Search, maintain phone board for number to string mapping, and iterate through the digits and loop through through its possible combinations(dfs) until the count of combination is equal to number of given digits.
//2. Return combinations.


//MARK: - Complexity

//- Time complexity:
// O(4^n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return [String]()
        }

        var combinations = [String](), combination = ""
        let numberToStr = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]

        dfs(&combinations, &combination, numberToStr, digits, 0)
        return combinations
    }

    private func dfs(_ combinations: inout [String], _ combination: inout String,
    _ numberToStr: [String], _ digits: String, _ index: Int) {
        if combination.count == digits.count {
            combinations.append(combination)
            return
        }

        let currentStr = fetchCurrentStr(digits, index, numberToStr)

        for char in currentStr {
            combination.append(char)
            dfs(&combinations, &combination, numberToStr, digits, index + 1)
            combination.removeLast()
        }
    }

    private func fetchCurrentStr(_ digits: String, _ index: Int, _ numberToStr: [String]) -> String {
        guard index < digits.count else {
            fatalError("Invalid index")
        }
        let currentDigitChar = digits[digits.index(digits.startIndex, offsetBy: index)]
        guard let currentDigit = Int(String(currentDigitChar)), currentDigit >= 0, currentDigit < numberToStr.count else {
            fatalError("Invalid digits")
        }
        return numberToStr[currentDigit]
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = "23"
solution.letterCombinations(input1) // ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]

//2.
var input2 = ""
solution.letterCombinations(input2) // []

//3.
var input3 = "9"
solution.letterCombinations(input3) // ["w", "x", "y", "z"]

//4.
var input4 = "0"
solution.letterCombinations(input4) // []
