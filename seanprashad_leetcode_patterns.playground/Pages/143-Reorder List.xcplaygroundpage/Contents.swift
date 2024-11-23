import Foundation

//https://leetcode.com/problems/reorder-list/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        // take mid point & cut
        var slow: ListNode? = head
        var fast: ListNode? = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        let mid: ListNode? = slow?.next
        slow?.next = nil
        
        // reverse
        var prev: ListNode? = nil
        var cur: ListNode? = mid
        while cur != nil {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        var rev: ListNode? = prev
        
        // zig zag
        cur = head
        while rev != nil {
            let curNext = cur?.next
            let revNext = rev?.next
            cur?.next = rev
            rev?.next = curNext
            rev = revNext
            if curNext != nil {
                cur = curNext
            } else {
                cur = cur?.next
            }
        }
    }
}
