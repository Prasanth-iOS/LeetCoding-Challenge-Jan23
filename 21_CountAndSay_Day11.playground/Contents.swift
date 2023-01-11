//MARK: - Count and Say

// Link: https://leetcode.com/problems/count-and-say/
// The count-and-say sequence is a sequence of digit strings defined by the recursive formula:
// countAndSay(1) = "1"
// countAndSay(n) is the way you would "say" the digit string from countAndSay(n-1), which is then converted into a different digit string.
// To determine how you "say" a digit string, split it into the minimal number of substrings such that each substring contains exactly one unique digit. Then for each substring, say the number of digits, then say the digit. Finally, concatenate every said digit.


//MARK: - Approach

//1. Maitain a result variable initilaized to "1", denotes countAndSay(1).
//2. Iterate until n - 1,
    //2.1. Iterate the result string, check for sequence of same character by checking the current character with next character. On a mismatch, keep the count and character as a string, and assign the string to result once the iteration finished.
//3. Return result at the end.


//MARK: - Complexity

//- Time complexity:
// O(n^2)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func countAndSay(_ n: Int) -> String {
        var result = "1"
        var index = 1
        while index < n {
            var str = ""
            var currentIndex = result.startIndex
            while currentIndex < result.endIndex {
                var count = 1
                while currentIndex != result.index(before: result.endIndex)
                    && result[currentIndex] == result[result.index(after: currentIndex)] {
                    count += 1
                    currentIndex = result.index(after: currentIndex)
                }
                str += "\(count)\(result[currentIndex])"
                currentIndex = result.index(after: currentIndex)
            }
            result = str
            index += 1
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
let input1 = 1
solution.countAndSay(input1) // "1"

//2.
let input2 = 4
solution.countAndSay(input2) // "1211"

//2.
let input3 = 10
solution.countAndSay(input3) // "13211311123113112211"
