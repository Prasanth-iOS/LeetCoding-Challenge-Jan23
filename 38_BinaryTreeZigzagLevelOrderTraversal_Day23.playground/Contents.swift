//MARK: - Binary Tree Zigzag Level Order Traversal

// Link: https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
// Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).


//MARK: - Approach

//1. Using queue to hold the next level of traversing items by appending left and right child nodes of nodes at current level, traverse until the queue becomes empty and append values to result. Have an Outer loop to move to next level(same as iterating a 2D matrix).
//2. Maintain a flag to toggle reverse on every alternate iterations. When set to true, the level should be reversed before appending to result.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation


//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        guard let node = root else {
            return result
        }
        var queue = [node]
        var isReverse = false
        while queue.count > 0 {
            var currQueueSize = queue.count
            var currLevelRes = [Int]()
            while currQueueSize > 0 {
                let currNode = queue.removeFirst()
                currLevelRes.append(currNode.val)
                if let left = currNode.left {
                    queue.append(left)
                }
                if let right = currNode.right {
                    queue.append(right)
                }
                currQueueSize -= 1
            }
            result.append(isReverse ? currLevelRes.reversed(): currLevelRes)
            isReverse.toggle()
        }
        return result
    }
}


//MARK: - Testing Sample Data
let solution = Solution()

//1. [2,1,3]
let head1 = TreeNode(2)
let node1_1 = TreeNode(1)
let node1_2 = TreeNode(3)

head1.left = node1_1
head1.right = node1_2

solution.zigzagLevelOrder(head1) // [[2], [3, 1]]


//2. [5,1,4,null,null,3,6]
let head2 = TreeNode(5)
let node2_1 = TreeNode(1)
let node2_2 = TreeNode(4)
let node2_3 = TreeNode(3)
let node2_4 = TreeNode(6)

head2.left = node2_1
head2.right = node2_2
node2_2.left = node2_3
node2_2.right = node2_4

solution.zigzagLevelOrder(head2) // [[5], [4, 1], [3, 6]]


//3. [1]
let head3 = TreeNode(1)

solution.zigzagLevelOrder(head3) // [[1]]


//4. [5,1,7,6,8,9,1]
let head4 = TreeNode(5)
let node4_1 = TreeNode(1)
let node4_2 = TreeNode(7)
let node4_3 = TreeNode(6)
let node4_4 = TreeNode(8)
let node4_5 = TreeNode(9)
let node4_6 = TreeNode(1)

head4.left = node4_1
head4.right = node4_2
node4_1.left = node4_3
node4_1.right = node4_4
node4_2.left = node4_5
node4_2.right = node4_6

solution.zigzagLevelOrder(head4) // [[5], [7, 1], [6, 8, 9, 1]]


//5. []
solution.zigzagLevelOrder(nil) // []
