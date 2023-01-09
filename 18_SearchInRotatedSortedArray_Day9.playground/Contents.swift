//MARK: - Search in Rotated Sorted Array

// Link: https://leetcode.com/problems/search-in-rotated-sorted-array/
// Given the array nums sorted in ascending order, after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

//MARK: - Approach

//1. Using Binary Search, check the mid value == target.
//2. Iterate till left <= right,
    //2.1. Check if the array is left or right sorted by comparing with the mid value.
    //2.2. Check the target is within its range.
    //2.3. Move the left or right pointer appropriately.
//3. Return '-1', when no match found.


//MARK: - Complexity

//- Time complexity:
// O(logn)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1

        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            }

            // if left sorted
            if nums[left] <= nums[mid] {
                if nums[left] <= target && target <= nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else { // if right sorted
                if nums[mid] <= target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. nums = [4,5,6,7,0,1,2], target = 0
solution.search([4,5,6,7,0,1,2], 0) // 4

//2. nums = [4,5,6,7,0,1,2], target = 3
solution.search([4,5,6,7,0,1,2], 3) // -1

//3. nums = [1], target = 0
solution.search([1], 0) // -1
