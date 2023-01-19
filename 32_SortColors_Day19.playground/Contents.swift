//MARK: - Sort Colors

// Link: https://leetcode.com/problems/sort-colors/
// Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.
// We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.


//MARK: - Approach

//1. Use Bucket Sort, iterate through the nums, move 0's and 2's to as left and right respectively, so that 1's will remain at the center.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var i = 0, left = 0, right = nums.count - 1
        while i <= right {
            if nums[i] == 0 {
                nums[i] = nums[left]
                nums[left] = 0
                left += 1
                i += 1
            } else if nums[i] == 2 {
                nums[i] = nums[right]
                nums[right] = 2
                right -= 1
            } else {
                i += 1
            }
        }
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [2,0,2,1,1,0]
solution.sortColors(&input1) // [0,0,1,1,2,2]

//2.
var input2 = [2,0,1]
solution.sortColors(&input2) // [0,1,2]

//3.
var input3 = [1]
solution.sortColors(&input3) // [1]
