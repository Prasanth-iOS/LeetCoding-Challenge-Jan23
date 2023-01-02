//MARK: - Reverse String

// Link: https://leetcode.com/problems/reverse-string/
// Given an integer n, return true if it is a power of three. Otherwise, return false.


//MARK: - Approach

//1. Using two pointers left and right initialized to '0' and 'count - 1' respectively, iterate until left less than right
//2. At each iteration, swap the elements at left and right from the given array and, increment and decrement left and right by '1' respectively.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func reverseString(_ s: inout [Character]) {
        var l = 0, r = s.count - 1
        while l < r {
            let temp = s[l]
            s[l] = s[r]
            s[r] = temp
            l += 1
            r -= 1
        }
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1: [Character] = ["h","e","l","l","o"]
solution.reverseString(&input1) // ["o","l","l","e","h"]

//2.
var input2: [Character] = ["H","a","n","n","a","h"]
solution.reverseString(&input2) // ["h","a","n","n","a","H"]

//3.
var input3: [Character] = ["a"]
solution.reverseString(&input3) // ["a"]
