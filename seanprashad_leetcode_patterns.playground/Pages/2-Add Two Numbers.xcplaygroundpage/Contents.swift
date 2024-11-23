import Foundation

//https://leetcode.com/problems/add-two-numbers/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var firNum: ListNode? = l1
        var secNum:  ListNode? = l2
        var res: ListNode? = nil
        var head: ListNode? = nil
        var rem = 0
        while firNum != nil || secNum != nil {
            let firVal = firNum?.val ?? 0
            let secVal = secNum?.val ?? 0
            let sum = firVal + secVal + rem
            rem = sum / 10
            if res != nil  {
                res?.next = ListNode(sum % 10)
                res = res?.next
            } else {
                res = ListNode(sum % 10)
                head = res
            }
            firNum = firNum?.next
            secNum = secNum?.next
        }
        if rem > 0 {
            res?.next = ListNode(rem)
        }
        return head
    }
}
