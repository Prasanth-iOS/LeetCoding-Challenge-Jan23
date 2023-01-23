//MARK: - Validate Binary Search Tree

// Link: https://leetcode.com/problems/validate-binary-search-tree/
// Given the root of a binary tree, determine if it is a valid binary search tree (BST).


//MARK: - Approach

//1. Maintain a min and max value for each node. Recursively call with the left and right nodes of a given node when it is inside the bounds of min and max. Also pass the current node value as max and min value for left and right node calls respectively.
//2. Return true if all the calls return true.


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
    func isValidBST(_ root: TreeNode?) -> Bool {
        isValidNode(root, nil, nil)
    }

    private func isValidNode(_ node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool{
        guard let node = node else {
            return true
        }
        if let min = min, node.val <= min {
            return false
        }
        if let max = max, node.val >= max {
            return false
        }
        return isValidNode(node.left, min, node.val) && isValidNode(node.right, node.val, max)
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

solution.isValidBST(head1) // true


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

solution.isValidBST(head2) // false


//3. [1,1]
let head3 = TreeNode(1)
let node3 = TreeNode(1)
head3.left = node3

solution.isValidBST(head3) // false


//4. [5,1,4,null,null,3,6]
let head4 = TreeNode(5)
let node4_1 = TreeNode(1)
let node4_2 = TreeNode(7)
let node4_3 = TreeNode(6)
let node4_4 = TreeNode(8)

head4.left = node4_1
head4.right = node4_2
node4_2.left = node4_3
node4_2.right = node4_4

solution.isValidBST(head4) // true
