import Foundation

//https://leetcode.com/problems/swap-nodes-in-pairs/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let first = head, let second = first.next else { return head }
        first.next = swapPairs(second.next)
        second.next = first
        return second
    }
}
