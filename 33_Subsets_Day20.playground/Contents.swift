//MARK: - Subsets

// Link: https://leetcode.com/problems/subsets/
// Given an integer array nums of unique elements, return all possible subsets (the power set).
// The solution set must not contain duplicate subsets. Return the solution in any order.


//MARK: - Approach

//1. Use dfs, iterate through the nums, for each element call dfs appending the subset to result at the begining, and backtrack.


//MARK: - Complexity

//- Time complexity:
// O(n2^n)
//
//- Space complexity:
// O(n2^n)


//MARK: - Code

import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var subset = [Int]()
        dfs(0, nums, &subset, &result)
        return result
    }

    private func dfs(_ idx: Int, _ nums: [Int], _ subset: inout [Int], _ result: inout [[Int]]) {
        result.append(subset)

        for i in idx..<nums.count {
            subset.append(nums[i])
            dfs(i + 1, nums, &subset, &result)
            subset.removeLast()
        }
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [1, 2, 3]
solution.subsets(input1) // [[], [1], [2], [1,2], [3], [1,3], [2,3], [1,2,3]]

//2.
var input2 = [0]
solution.subsets(input2) // [[],[0]]

//3.
var input3 = [1, 2]
solution.subsets(input3) // [[], [1], [1,2], [2]]
