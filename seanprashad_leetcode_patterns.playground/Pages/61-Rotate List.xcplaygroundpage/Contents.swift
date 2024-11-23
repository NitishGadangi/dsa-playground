import Foundation

//https://leetcode.com/problems/rotate-list/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head, k > 0 else { return head }
        
        var len = 0
        var cur: ListNode? = head
        while cur != nil {
            cur = cur?.next
            len += 1
        }
        var k = k % len
        guard k > 0 else { return head }
        
        var fast: ListNode? = head
        for _ in 0..<k {
            fast = fast?.next
        }
        
        var slow: ListNode? = head
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        var res = slow?.next
        slow?.next = nil
        fast?.next = head
        return res
    }
}
