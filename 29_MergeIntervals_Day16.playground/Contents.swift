//MARK: - Merge Intervals

// Link: https://leetcode.com/problems/merge-intervals/
// Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.


//MARK: - Approach

//1. Sort the intervals with the start value.
//2. Iterate through the intervals, check the current start value overlaps with previous by checking start < previous end, then assign the end the max of prev end and current end value.
//3. If no overlap, then append it to the result.
//4. Return result.


//MARK: - Complexity

//- Time complexity:
// O(nlogn)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var intervals = intervals.sorted {
            $0.first! < $1.first!
        }
        var result = [[Int]]()
        for currInterval in intervals {
            if let last = result.last, currInterval[0] <= last[1] {
                result[result.count - 1][1] = max(currInterval[1], last[1])
            } else {
                result.append(currInterval)
            }
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [[1,3],[2,6],[8,10],[15,18]]
solution.merge(input1) // [[1,6],[8,10],[15,18]]

//2.
var input2 = [[1,4],[4,5]]
solution.merge(input2) // [[1,5]]

//3.
var input3 = [[1,4],[0,0]]
solution.merge(input3) // [[0, 0], [1, 4]]
