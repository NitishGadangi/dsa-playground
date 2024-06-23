import Foundation

//https://leetcode.com/problems/reverse-nodes-in-k-group/?envType=study-plan-v2&envId=top-interview-150

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

        var count = 0
        var test = head
        while (count < k) && (test != nil) {
            test = test?.next
            count += 1
        }
        if count != k {
            return head
        }

        var cur = head
        var next: ListNode? = nil
        var prev: ListNode? = nil
        var idx = 0
        while (idx < k) && (cur != nil) {
            next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
            idx += 1
        }
        head?.next = reverseKGroup(cur, k)
        return prev
    }
}
