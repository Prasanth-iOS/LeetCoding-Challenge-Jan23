//MARK: - Intersection of Two Arrays II

// Link: https://leetcode.com/problems/intersection-of-two-arrays-ii/
// Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.


//MARK: - Approach

//1. Maintain a dictionary to capture the frequency of each integer in nums1.
//2. Iterate through nums, if the integer element is available in the dictionary with frequency count > 0, decrement the count and append it to the result array.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1Freq = Dictionary(nums1.map { ($0, 1) }, uniquingKeysWith: +)
        var result: [Int] = []
        for num in nums2 {
            if let freq = nums1Freq[num], freq > 0 {
                result.append(num)
                nums1Freq[num] = freq - 1
            }
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [1,2,2,1], input1_1 = [2,2]
solution.intersect(input1, input1_1) // [2,2]

//2.
var input2 = [4,9,5], input2_1 = [9,4,9,8,4]
solution.intersect(input2, input2_1) // [9,4]

//3.
var input3 = [2], input3_1 = [3]
solution.intersect(input3, input3_1) // []
