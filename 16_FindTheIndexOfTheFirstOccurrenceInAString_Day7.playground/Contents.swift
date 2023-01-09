//MARK: - Find the Index of the First Occurrence in a String

// Link: https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/
// Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.


//MARK: - Approach

//1. Using two pointers, maintain left pointer to the start index and the right pointer to the count of needle string.
//2. Iterate haystack with right pointe, when the slice of haystack matches with needle, return the left index value.
//3. If no match found, return -1.


//MARK: - Complexity

//- Time complexity:
// O(nm)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else {
            return -1
        }
        var leftIdx = haystack.startIndex
        var rightIdx = haystack.index(
            haystack.startIndex,
            offsetBy: needle.count - 1
        )
        while rightIdx < haystack.endIndex {
            if haystack[leftIdx...rightIdx] == needle {
                return haystack.distance(from: haystack.startIndex, to: leftIdx)
            }
            leftIdx = haystack.index(after: leftIdx)
            rightIdx = haystack.index(after: rightIdx)
        }
        return -1
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
solution.strStr("sadbutsad", "sad") // 0

//2.
solution.strStr("leetcode", "leeto") // -1

//3.
solution.strStr("problemstr", "str") // 7
