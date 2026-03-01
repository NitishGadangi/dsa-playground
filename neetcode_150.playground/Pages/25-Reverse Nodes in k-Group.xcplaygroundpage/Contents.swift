import Foundation

//https://leetcode.com/problems/reverse-nodes-in-k-group/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head else { return nil }
        var cur: ListNode? = head
        var prev: ListNode? = nil

        // check if k nodes are available
        var count = 0
        var test: ListNode? = head
        while count < k && test != nil {
            test = test?.next
            count += 1
        }
        guard count == k else { return head }

        count = 0
        while count < k {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
            count += 1
        }

        head.next = reverseKGroup(cur, k)
        return prev
    }
}
