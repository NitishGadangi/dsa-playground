import Foundation

//https://leetcode.com/problems/sort-list/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head, let next = head.next else { return head }
        var slow: ListNode? = head
        var fast: ListNode? = next
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        let mid = slow?.next
        slow?.next = nil
        let l1 = sortList(head)
        let l2 = sortList(mid)
        return merge(l1: l1, l2: l2)
    }

    func merge(l1: ListNode?, l2: ListNode?) -> ListNode? {
        guard let l1 else { return l2 }
        guard let l2 else { return l1 }
        if l1.val < l2.val {
            l1.next = merge(l1: l1.next, l2: l2)
            return l1
        }
        l2.next = merge(l1: l1, l2: l2.next)
        return l2
    }
}
