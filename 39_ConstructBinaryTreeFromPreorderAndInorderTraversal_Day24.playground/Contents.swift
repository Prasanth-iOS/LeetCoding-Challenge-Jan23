//MARK: - Construct Binary Tree from Preorder and Inorder Traversal

// Link: https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
// Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.


//MARK: - Approach

// In a Preorder sequence, the leftmost element is the root of the tree. So preorder[0] is the root for given sequences. By searching the value of preorder[0] in the Inorder sequence, we can find out all elements on the left side of it is in the left subtree and elements on right in the right subtree.

//1. Pick first element from Preorder. Increment Preorder Index to pick the next element in the next recursive call.
//2. Create a new tree node 'root' with the value as the picked element.
//3. Find the picked element’s index in Inorder. Let the index be 'mid'.
//4. Call buildTree for elements before 'mid' to build tree as a left subtree of 'root' node.
//5. Call buildTree for elements after 'mid' to build tree as a right subtree of 'root' node.
//6. Return 'root' node.


//MARK: - Complexity

//- Time complexity:
// O(nlogn)
//
//- Space complexity:
// O(1)


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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let root = TreeNode(preorder[0])
        let mid: Int! = inorder.firstIndex(of: preorder[0])
        if mid > 0 {
            root.left = buildTree(Array(preorder[1...mid]), Array(inorder[(..<mid)]))
        }
        if mid < inorder.count - 1 {
            root.right = buildTree(Array(preorder[(mid + 1)...]), Array(inorder[(mid + 1)...]))
        }
        return root
    }
}


//MARK: - Testing Sample Data
let solution = Solution()

//1. preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
solution.buildTree([3,9,20,15,7], [9,3,15,20,7])

//2. preorder = [-1], inorder = [-1]
solution.buildTree([-1], [-1])
