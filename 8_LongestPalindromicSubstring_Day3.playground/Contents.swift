//MARK: - Longest Palindromic Substring

// Link: https://leetcode.com/problems/longest-palindromic-substring/
// Given a string s, return the longest palindromic substring in s.


//MARK: - Approach

//1. Maintain a start and maxLen variables initialized to '0' to hold the start index and length of palindromic substring.
//2. Iterate the string for odd and even cases by decrementing to the left and incrementing to the right when both the character at specified index matches.
//3. Check and assign if maxLen and start if it has maximum length of characters as palindrome.
//4. Return the substring from start index to the specified length.


//MARK: - Complexity

//- Time complexity:
// O(n^2)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        let sChars = Array(s)
        var start = 0, maxLen = 0
        for i in 0..<sChars.count {
            searchPalindrome(sChars, i, i, &start, &maxLen)
            searchPalindrome(sChars, i, i + 1, &start, &maxLen)
        }
        return String(sChars[start..<start + maxLen])
    }
    
    private func searchPalindrome(_ chars: [Character], _ l: Int, _ r: Int, _ start: inout Int, _ maxLen: inout Int) {
        var l = l, r = r
        while l >= 0 && r < chars.count && chars[l] == chars[r] {
            l -= 1
            r += 1
        }
        if maxLen < r - l - 1 {
            start = l + 1
            maxLen = r - l - 1
        }
    }
}

//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = "babad"
solution.longestPalindrome(input1) // "bab"

//2.
var input2 = "cbbd"
solution.longestPalindrome(input2) // "bb"

//3.
var input3 = "a"
solution.longestPalindrome(input3) // "a"
