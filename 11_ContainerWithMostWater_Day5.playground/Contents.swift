//MARK: - Container With Most Water

// Link: https://leetcode.com/problems/container-with-most-water/
// You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
// Find two lines that together with the x-axis form a container, such that the container contains the most water.
// Return the maximum amount of water a container can store.
// Notice that you may not slant the container.


//MARK: - Approach

//1. Start iterating from the widest area by keeping lef and right pointer to '0' and 'count - 1' respectively.
//2. Check and assign the maximum capacity for each iteration and move towards the maximum side.
//3. The maximum capacity can be calculated by multiplying the minimum value out of the two pointers and length between them.
//4. Return maximum capacity.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 2 else { return min(height[0], height[1]) }
        var left = 0, right = height.count - 1, maxCapacity = 0
        while left < right {
            let minHeight = min(height[left], height[right])
            let length = right - left
            maxCapacity = max(maxCapacity, minHeight * length)
            if minHeight == height[left] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxCapacity
    }
}

//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [1,8,6,2,5,4,8,3,7]
solution.maxArea(input1) // 49

//2.
var input2 = [1,1]
solution.maxArea(input2) // 1

//3.
var input3 = [1,2,1]
solution.maxArea(input3) // 2
