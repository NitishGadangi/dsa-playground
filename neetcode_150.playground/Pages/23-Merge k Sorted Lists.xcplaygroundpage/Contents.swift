import Foundation

//https://leetcode.com/problems/merge-k-sorted-lists/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        return divideAndConcur(lists, start: 0, end: lists.count - 1)
    }

    func divideAndConcur(_ lists: [ListNode?], start: Int, end: Int) -> ListNode? {
        guard start < end else { return lists[start] }
        let mid = start + (end - start)/2
        let list1 = divideAndConcur(lists, start: start, end: mid)
        let list2 = divideAndConcur(lists, start: mid + 1, end: end)
        return merge(list1, list2)
    }

    func merge(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 else { return list2 }
        guard let list2 else { return list1 }
        if list1.val < list2.val {
            list1.next = merge(list1.next, list2)
            return list1
        }
        list2.next = merge(list1, list2.next)
        return list2
    }
}
