//MARK: - Jump Game

// Link: https://leetcode.com/problems/jump-game/
// You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.
// Return true if you can reach the last index, or false otherwise.


//MARK: - Approach

//1. Maintain maxIndex which will hold the index after jump value specified in the index, initialized to '0'.
//2. Iterate nums, it can for each element calculate the max index it can jump and store in the maIndex if it is greater than the existing max.
//3. If the last index can be visited with maxIndex(max index > nums.count - 1), then return true.
//4. If the nextIndex can't be visited with maxIndex, return false.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var maxIndex = 0
        for (i, num) in nums.enumerated() {
            let maxIndex = max(maxIndex, i + num)
            if maxIndex >= nums.count - 1 {
                return true
            }
            if maxIndex == i {
                break
            }
        }
        return false
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [2,3,1,1,4]
solution.canJump(input1) // true

//2.
var input2 = [3,2,1,0,4]
solution.canJump(input2) // false

//3.
var input3 = [0]
solution.canJump(input3) // true
