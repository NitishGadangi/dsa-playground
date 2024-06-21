//: [Previous](@previous)

import Foundation

//https://leetcode.com/problems/add-two-numbers/?envType=study-plan-v2&envId=top-interview-150

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var resNode: ListNode?
        var curNode: ListNode?
        var tempL1 = l1
        var tempL2 = l2
        var rem: Int = 0
        while (tempL1 != nil) || (tempL2 != nil) {
            var num1 = tempL1?.val ?? 0
            var num2 = tempL2?.val ?? 0
            var sum = num1 + num2 + rem
            if curNode == nil {
                resNode = ListNode(sum % 10)
                curNode = resNode
            } else {
                curNode?.next = ListNode(sum % 10)
                curNode = curNode?.next
            }
            rem = sum / 10
            tempL1 = tempL1?.next
            tempL2 = tempL2?.next
        }
        if rem > 0 {
            curNode?.next = ListNode(rem)
        }
        return resNode
    }
}
