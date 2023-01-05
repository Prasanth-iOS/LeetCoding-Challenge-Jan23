//MARK: - 3Sum

// Link: https://leetcode.com/problems/3sum/
// Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
// Notice that the solution set must not contain duplicate triplets.


//MARK: - Approach

//1. Sort the array.
//2. Iterate the array, keeping as first sum.
    //2.1. Maintain left and right pointers initialized to 'first index + 1' and 'count - 1' respectively.
    //2.2. Iterate until left < right, check the sum of 3 pointer values,
        //2.2.1. if the sum is equal to '0', append it to result. Increment and decrement left and right pointers until the next value is not a duplicate.
        //2.2.2. else if the sum is less than '0', increment left.
        //2.2.3. else, decrement right.
//3. Return result.


//MARK: - Complexity

//- Time complexity:
// O(n^2)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let nums = nums.sorted()
        
        for i in 0..<nums.count - 2 {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            
            var left = i + 1, right = nums.count - 1
            
            while left < right {
                let sum = nums[left] + nums[right] + nums[i]
                if sum == 0 {
                    result.append([nums[i], nums[left], nums[right]])
                    
                    repeat {
                        left += 1
                    } while nums[left] == nums[left - 1] && left < right
                    
                    repeat {
                        right -= 1
                    }while nums[right] == nums[right + 1] && left < right
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [-1,0,1,2,-1,-4]
solution.threeSum(input1) // [[-1, -1, 2], [-1, 0, 1]]

//2.
var input2 = [0,1,1]
solution.threeSum(input2) // []

//3.
var input3 = [0,0,0]
solution.threeSum(input3) // [[0, 0, 0]]
