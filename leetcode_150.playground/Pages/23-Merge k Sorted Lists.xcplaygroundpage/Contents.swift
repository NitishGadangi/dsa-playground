import Foundation

//https://leetcode.com/problems/merge-k-sorted-lists/?envType=study-plan-v2&envId=top-interview-150

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        return divideAndMerge(lists, start: 0, end: lists.count - 1)
    }

    func divideAndMerge(_ lists: [ListNode?], start: Int, end: Int) -> ListNode? {
        guard start < end else { return lists[start] }
        let mid = start + (end - start)/2
        let head1 = divideAndMerge(lists, start: start, end: mid)
        let head2 = divideAndMerge(lists, start: mid + 1, end: end)
        return merge(head1: head1, head2: head2)
    }

    // merge two sorted linked lists
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

