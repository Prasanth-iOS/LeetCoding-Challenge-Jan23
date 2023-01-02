//MARK: - First Unique Character in a String

// Link: https://leetcode.com/problems/first-unique-character-in-a-string/
// Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.


//MARK: - Approach

//1. Maintain a dictionary which will have a boolean set against each character of the string.
//2. Iterate through the string, assign true for the first time and false if the character repeats.
//3. Iterate through the dictionary with index to find the char which is set to true and the return the respective index.
//4. Retrun '-1' when the loop completes.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)
// Note: The maximum space of the dictionary is 26, so space complexity is O(1)


//MARK: - Code

import Foundation

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var uniqueDict = [Character: Bool]()
        for char in s {
            if uniqueDict[char] == nil {
                uniqueDict[char] = true
            } else {
                uniqueDict[char] = false
            }
        }
        for (i, char) in s.enumerated() {
            if uniqueDict[char] == true {
                return i
            }
        }
        return -1
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = "leetcode"
solution.firstUniqChar(input1) // 0

//2.
var input2 = "loveleetcode"
solution.firstUniqChar(input2) // 2

//3.
var input3 = "aabb"
solution.firstUniqChar(input3) // -1
