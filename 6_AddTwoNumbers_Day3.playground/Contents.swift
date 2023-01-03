//MARK: - Add Two Numbers

// Link: https://leetcode.com/problems/add-two-numbers/
// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.




//MARK: - Approach

//1. Maintain a carry variable initialized to '0' and a dummy node to save the result.
//2. Iterate through the lists until both are 'nil'. For each iteration,
    //2.1 Calculate the sum of values in both nodes(default to '0' for no value) added by carry.
    //2.2 Apply modulo to sum to get the node value and append it the dummy node
    //2.2 Divide the sum by '10' to get the carry.
//3. Create a new node with the value as carry and add it to the dummy node.
//4. Return node head.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyNode = ListNode()
        var node1 = l1, node2 = l2, sumNode = dummyNode
        var carry = 0
        while node1 != nil || node2 != nil {
            let sum = (node1?.val ?? 0) + (node2?.val ?? 0) + carry
            carry = sum / 10
            sumNode.next = ListNode(sum % 10)
            sumNode = sumNode.next!
            
            node1 = node1?.next
            node2 = node2?.next
        }
        if carry > 0 {
            sumNode.next = ListNode(carry)
        }
        return dummyNode.next
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. [2,4,3], [5,6,4]
let head1 = ListNode(2)
let node1_1 = ListNode(4)
let node1_2 = ListNode(3)
head1.next = node1_1
node1_1.next = node1_2

let head2 = ListNode(5)
let node2_1 = ListNode(6)
let node2_2 = ListNode(4)
head2.next = node2_1
node2_1.next = node2_2

solution.addTwoNumbers(head1, head2) // [7,0,8]


//2. [0], [0]
let head3 = ListNode(0)
let head3_1 = ListNode(0)

solution.addTwoNumbers(head3, head3_1) // [0]


//3. [9,9,9,9,9,9,9], [9,9,9,9]
let head4 = ListNode(9)
let node4_1 = ListNode(9)
let node4_2 = ListNode(9)
let node4_3 = ListNode(9)
let node4_4 = ListNode(9)
let node4_5 = ListNode(9)
let node4_6 = ListNode(9)
head4.next = node4_1
node4_1.next = node4_2
node4_2.next = node4_3
node4_3.next = node4_4
node4_4.next = node4_5
node4_5.next = node4_6

let head5 = ListNode(9)
let node5_1 = ListNode(9)
let node5_2 = ListNode(9)
let node5_3 = ListNode(9)
head5.next = node5_1
node5_1.next = node5_2
node5_2.next = node5_3
solution.addTwoNumbers(head4, head5) // [8,9,9,9,0,0,0,1]
