//MARK: - Longest Consecutive Sequence

// Link: https://leetcode.com/problems/longest-consecutive-sequence/
// Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
// You must write an algorithm that runs in O(n) time.


//MARK: - Approach

// The idea is to use Hashing. We first insert all elements in a Set. Then check all the possible consecutive subsequences for each element.
//1. Insert all array elements to hash set.
//2. Do dfs for every element arr[i] as follows,
    //2.1 Check if this element is present in the hash, else return.
    //2.2 Increment the length by '1', check and assign if it is the max length, and remove the element from set.
    //2.3 Then do two recursive calls of the dfs method with (num + 1) and (num - 1) respectively to find the subsequences.
//3. Return the longest sequence.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set(nums), longest = 0
        
        for num in nums {
            var length = 0
            dfs(num, &set, &length, &longest)
        }
        return longest
    }

    private func dfs(_ num: Int, _ set: inout Set<Int>, _ length: inout Int, _ longest: inout Int) {
        guard set.contains(num) else {
            return
        }
        
        length += 1
        longest = max(length, longest)
        set.remove(num)
        
        dfs(num + 1, &set, &length, &longest)
        dfs(num - 1, &set, &length, &longest)
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [100,4,200,1,3,2]
solution.longestConsecutive(input1) // 4

//2.
var input2 = [0,3,7,2,5,8,4,6,0,1]
solution.longestConsecutive(input2) // 9

//3.
var input3 = [7,17,27,37,107]
solution.longestConsecutive(input3) // 1

//4.
var input4 = [Int]()
solution.longestConsecutive(input4) // 0
