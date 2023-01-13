//MARK: - Group Anagrams

// Link: https://leetcode.com/problems/group-anagrams/
// Given an array of strings strs, group the anagrams together. You can return the answer in any order.


//MARK: - Approach

//1. Sort each word in the array and use it as key to the word, so the anagrams would be grouped together in an array under same key.
//2. Return the dictionary values.


//MARK: - Complexity

//- Time complexity:
// O(mnlogn)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        return Array(
            Dictionary(
                strs.map {
                    (String($0.sorted()), [$0])
                },
                uniquingKeysWith: +).values
        )
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = ["eat","tea","tan","ate","nat","bat"]
solution.groupAnagrams(input1) // [["bat"],["nat","tan"],["ate","eat","tea"]]

//2.
var input2 = [""]
solution.groupAnagrams(input2) // [[""]]

//3.
var input3 = ["a"]
solution.groupAnagrams(input3) // [["a"]]
