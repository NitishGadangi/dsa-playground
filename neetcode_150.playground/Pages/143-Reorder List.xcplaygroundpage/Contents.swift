import Foundation

//https://leetcode.com/problems/reorder-list/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        // find mid
        var slow = head
        var fast = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        let mid = slow?.next
        slow?.next = nil

        // reverse second half
        var prev: ListNode? = nil
        var cur = mid
        while cur != nil {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }

        // join zig-zag
        var first = head
        var second = prev
        while first != nil && second != nil {
            let nextFirst = first?.next
            let nextSecond = second?.next
            first?.next = second
            second?.next = nextFirst
            first = nextFirst
            second = nextSecond
        }
    }
}
