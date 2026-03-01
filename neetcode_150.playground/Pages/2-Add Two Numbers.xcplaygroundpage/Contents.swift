import Foundation

//https://leetcode.com/problems/add-two-numbers/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var sum: ListNode? = nil
        var head: ListNode? = nil
        var carry: Int = 0
        while l1 != nil && l2 != nil {
            let curSum = l1!.val + l2!.val + carry
            carry = curSum / 10
            let curVal = curSum % 10
            if sum != nil {
                sum?.next = ListNode(curVal)
                sum = sum?.next
            } else {
                sum = ListNode(curVal)
                head = sum
            }
            l1 = l1?.next
            l2 = l2?.next
        }

        if l2 != nil { l1 = l2 }

        while l1 != nil {
            let curSum = l1!.val + carry
            carry = curSum / 10
            let curVal = curSum % 10
            if sum != nil {
                sum?.next = ListNode(curVal)
                sum = sum?.next
            } else {
                sum = ListNode(curVal)
                head = sum
            }
            l1 = l1?.next
        }

        if carry != 0 {
            sum?.next = ListNode(carry)
        }
        return head
    }
}
