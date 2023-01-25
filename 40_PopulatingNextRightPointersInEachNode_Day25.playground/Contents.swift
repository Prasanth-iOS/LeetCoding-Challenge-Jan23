//MARK: - Populating Next Right Pointers in Each Node

// Link: https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
// Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.


//MARK: - Approach

//1. The idea is to perform a level order traversal and for each node in a level set its next pointer to the next node in the same level.
//2. currNode->left->next = currNode->right and currNode->right->next = currNode->next->left, then do recursive call with current node's left and right child to perform the same operation for the subsequent levels.
//3. For the last node in a level, set its next pointer to NULL.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation


//Definition for a binary tree node.
public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
      public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}


class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root, root.left != nil, root.right != nil else {
            return root
        }
        root.left?.next = root.right
        if root.next != nil {
            root.right?.next = root.next?.left
        }
        connect(root.left)
        connect(root.right)
        return root
    }
}


//MARK: - Testing Sample Data
let solution = Solution()

//1. [1,2,3,4,5,6,7]
let head1 = Node(1)
let node1_1 = Node(2)
let node1_2 = Node(3)
let node1_3 = Node(4)
let node1_4 = Node(5)
let node1_5 = Node(6)
let node1_6 = Node(7)

head1.left = node1_1
head1.right = node1_2
node1_1.left = node1_3
node1_1.right = node1_4
node1_2.left = node1_5
node1_2.right = node1_6

solution.connect(head1) // [1,#,2,3,#,4,5,6,7,#]


//2. []
solution.connect(nil) // []

