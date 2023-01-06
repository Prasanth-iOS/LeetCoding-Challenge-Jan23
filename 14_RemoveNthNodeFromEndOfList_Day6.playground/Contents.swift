//MARK: - Remove Nth Node From End of List

// Link: https://leetcode.com/problems/remove-nth-node-from-end-of-list/
// Given the head of a linked list, remove the nth node from the end of the list and return its head.


//MARK: - Approach
//1. Using Runner Technique, maintain two nodes initialize to the given head. Simply iterate the first node n-1 times.
//2. Now iterate the second node along with first node unti first node's next is nil, so that the second node come to the nth node from the end of the list.
//4. Point the second node's next to next.next to remove the required node.
//3. Maintain a dummy node to return the head.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummyNode = ListNode()
        dummyNode.next = head
        var currentNode: ListNode? = dummyNode
        var resultNode: ListNode? = dummyNode

        for _ in 0..<n {
            currentNode = currentNode?.next
        }

        while currentNode?.next != nil {
            currentNode = currentNode?.next
            resultNode = resultNode?.next
        }

        resultNode?.next = resultNode?.next?.next

        return dummyNode.next
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. [1,2,3,4,5], n = 2
let head1 = ListNode(1)
let node1_1 = ListNode(2)
let node1_2 = ListNode(3)
let node1_3 = ListNode(4)
let node1_4 = ListNode(5)

head1.next = node1_1
node1_1.next = node1_2
node1_2.next = node1_3
node1_3.next = node1_4
solution.removeNthFromEnd(head1, 2) // [1, 2, 3, 5]


//2. [1], n = 1
let head2 = ListNode(1)
solution.removeNthFromEnd(head2, 1) // nil


//3. [1,2], n = 1
let head3 = ListNode(1)
let node3_1 = ListNode(2)

head3.next = node3_1
solution.removeNthFromEnd(head3, 1) // [1]
