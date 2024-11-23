import Foundation

//https://leetcode.com/problems/reverse-nodes-in-k-group/

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
        guard k > 0 else { return head }
        var cur: ListNode? = head
        
        // check if len is greater than k
        var count = k
        while count > 0 && cur != nil {
            count -= 1
            cur = cur?.next
        }
        guard count == 0 else { return head }
        
        cur = head
        var prev: ListNode? = nil
        for _ in 0..<k {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        let root = prev
        head.next = reverseKGroup(cur, k)
        return root
    }
}
