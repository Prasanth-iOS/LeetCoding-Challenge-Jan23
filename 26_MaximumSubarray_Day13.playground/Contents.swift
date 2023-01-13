//MARK: - Maximum Subarray

// Link: https://leetcode.com/problems/maximum-subarray/
// Given an integer array nums, find the subarray with the largest sum, and return its sum.


//MARK: - Approach

//1. Iterate the nums adding each to a sum variable and assign it as max sum if it is greater than the existing sum. Whenever the current sum < 0, reset it to '0'.
//2. Return maxSum.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var currSum = 0, maxSum = nums.first!
        for num in nums {
            if currSum < 0 {
                currSum = 0
            }
            currSum += num
            maxSum = max(currSum, maxSum)
        }
        return maxSum
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [-2,1,-3,4,-1,2,1,-5,4]
solution.maxSubArray(input1) // 6

//2.
var input2 = [1]
solution.maxSubArray(input2) // 1

//3.
var input3 = [5,4,-1,7,8]
solution.maxSubArray(input3) // 23

//4.
var input4 = [-1,-20,-3,-1,-5]
solution.maxSubArray(input4) // -1
