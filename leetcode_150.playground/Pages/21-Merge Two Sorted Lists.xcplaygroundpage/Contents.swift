import Foundation

//https://leetcode.com/problems/merge-two-sorted-lists/?envType=study-plan-v2&envId=top-interview-150

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 else { return list2 }
        guard let list2 else { return list1 }

        let l1num = list1.val
        let l2num = list2.val
        if l1num < l2num {
            list1.next = mergeTwoLists(list1.next, list2)
            return list1
        }
        list2.next = mergeTwoLists(list1, list2.next)
        return list2
    }
}
