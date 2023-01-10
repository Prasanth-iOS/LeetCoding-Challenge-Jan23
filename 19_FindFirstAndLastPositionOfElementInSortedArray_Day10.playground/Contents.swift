//MARK: - Find First and Last Position of Element in Sorted Array

// Link: https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
// Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.
// If target is not found in the array, return [-1, -1].


//MARK: - Approach

//1. Do binary search with left, right and mid pointer as usual, but twice each to find starting and ending index.
//2. For start index, whenever mid == target, save the mid index in a var and assign right = mid - 1.
//3. For end index, whenever mid == target, save the mid index in a var and assign left = mid + 1.
//4. Return both saved index.


//MARK: - Complexity

//- Time complexity:
// O(logn)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var i = binarySearch(nums, target, true)
        var j = binarySearch(nums, target, false)
        return [i, j]
    }
    
    private func binarySearch(_ nums: [Int], _ target: Int, _ leftBias: Bool) -> Int {
        var left = 0, right = nums.count - 1, i = -1
        while left <= right {
            var mid = (left + right) / 2
            if target < nums[mid] {
                right = mid - 1
            } else if target > nums[mid] {
                left = mid + 1
            } else {
                i = mid
                if leftBias {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return i
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. nums = [5,7,7,8,8,10], target = 8
solution.searchRange([5,7,7,8,8,10], 8) // [3, 4]

//2. nums = [5,7,7,8,8,10], target = 6
solution.searchRange([5,7,7,8,8,10], 6) // [-1, -1]

//3. nums = [], target = 0
solution.searchRange([Int](), 0) // [-1, -1]

//4. nums = [-3,-3,-3,-3,-3,-3], target = -3
solution.searchRange([-3,-3,-3,-3,-3,-3], -3) // [0, 5]
