//MARK: - Best Time to Buy and Sell Stock II

// Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
// You are given an integer array prices where prices[i] is the price of a given stock on the ith day.
// On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.
// Find and return the maximum profit you can achieve.


//MARK: - Approach

// When buying the stocks in the beginning of the upstreak in the stock and sell it at the highest point of that upstreak. We just have to calculate the sum of all the upstreaks that are present.
//1. Iterate from 1st index to check if it is greater than the previous one and add it to 'maxProfit'.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        for i in 1..<prices.count where prices[i] > prices[i - 1] {
            maxProfit += prices[i] - prices[i - 1]
        }
        return maxProfit
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [7,1,5,3,6,4]
solution.maxProfit(input1) // 7

//2.
var input2 = [1,2,3,4,5]
solution.maxProfit(input2) // 4

//3.
var input3 = [7,6,4,3,1]
solution.maxProfit(input3) // 0

//4.
var input4 = [5]
solution.maxProfit(input4) // 0
