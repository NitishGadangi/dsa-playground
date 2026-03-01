import Foundation

//https://leetcode.com/problems/remove-nth-node-from-end-of-list/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var count = 0
        var fast = head
        while fast != nil && count < n {
            fast = fast?.next
            count += 1
        }
        guard count == n else { return head }
        guard fast != nil else { return head?.next }

        var cur = head
        while fast?.next != nil {
            cur = cur?.next
            fast = fast?.next
        }
        cur?.next = cur?.next?.next

        return head
    }
}
