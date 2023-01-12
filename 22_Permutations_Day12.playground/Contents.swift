//MARK: - Permutations

// Link: https://leetcode.com/problems/permutations/
// Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.


//MARK: - Approach

//1. Using Depth First Search, iterate through the elements and by maintaining an array of visited nodes, recursively call the same function without the recently appended value to make sure there is no duplicate elements.
//2. Return combinations.


//MARK: - Complexity

//- Time complexity:
// O(n^n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var combination = [Int]()
        var combinations = [[Int]]()
        var isVisited = [Bool](repeating: false, count: nums.count)
        dfs(nums, &combination, &combinations, &isVisited)
        return combinations
    }

    private func dfs(_ nums: [Int], _ combination: inout [Int], _ combinations: inout [[Int]], _ isVisited: inout [Bool]) {
        if combination.count == nums.count {
            combinations.append(combination)
            return
        }
        for (i, num) in nums.enumerated() where !isVisited[i] {
            combination.append(num)
            isVisited[i] = true
            dfs(nums, &combination, &combinations, &isVisited)
            isVisited[i] = false
            combination.removeLast()
        }
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [1,2,3]
solution.permute(input1) // [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

//2.
var input2 = [0,1]
solution.permute(input2) // [[0, 1], [1, 0]]

//3.
var input3 = [1]
solution.permute(input3) // [[1]]
