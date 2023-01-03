//MARK: - Longest Substring Without Repeating Characters

// Link: https://leetcode.com/problems/longest-substring-without-repeating-characters/
// Given a string s, find the length of the longest substring without repeating characters.


//MARK: - Approach

//1. Maintain a dictionary to hold the next possible valid position of characters of the non-repeating substring
//2. Iterate the string to update maxLen, dictionary, and startIdx encountering duplicates
//2. Return maxLen.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map = [Character: Int]()
        var startIdx = 0, maxLen = 0

        for (i, char) in s.enumerated() {
            if let pos = map[char] {
                if startIdx <= pos {
                    startIdx = pos + 1
                }
            }
            maxLen = max(maxLen, i - startIdx + 1)
            map[char] = i
        }
        return maxLen
    }
}

//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = "abcabcbb"
solution.lengthOfLongestSubstring(input1) // 3

//2.
var input2 = "bbbbb"
solution.lengthOfLongestSubstring(input2) // 1

//3.
var input3 = "pwwkew"
solution.lengthOfLongestSubstring(input3) // 3
