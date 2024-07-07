import Foundation

//https://leetcode.com/problems/sort-list/description/?envType=study-plan-v2&envId=top-interview-150

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
            slow = slow?.next
            fast = fast?.next?.next
        }
        var head2 = slow?.next
        var head1: ListNode? = head
        slow?.next = nil // break into two

        head1 = sortList(head1)
        head2 = sortList(head2)
        return merge(head1: head1, head2: head2)
    }

    // merge sorted linked lists
    func merge(head1: ListNode?, head2: ListNode?) -> ListNode? {
        guard let head1 else { return head2 }
        guard let head2 else { return head1 }

        if head1.val < head2.val {
            head1.next = merge(head1: head1.next, head2: head2)
            return head1
        }

        head2.next = merge(head1: head1, head2: head2.next)
        return head2
    }
}
