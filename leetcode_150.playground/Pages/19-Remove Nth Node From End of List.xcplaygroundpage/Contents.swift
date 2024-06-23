import Foundation

//https://leetcode.com/problems/remove-nth-node-from-end-of-list/?envType=study-plan-v2&envId=top-interview-150

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy = ListNode(-1, head)
        var start: ListNode? = dummy
        var end = head

        for _ in 0..<n {
            end = end?.next
        }

        while end != nil {
            start = start?.next
            end = end?.next
        }
        start?.next = start?.next?.next

        return dummy.next
    }
}

class AlternateSolution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var prev: ListNode? = nil
        var start = head
        var end = head
        var idx = 0
        while idx < n {
            end = end?.next
            idx += 1
        }

        guard end != nil else { return head?.next }

        while end != nil {
            prev = start
            start = start?.next
            end = end?.next
        }
        prev?.next = start?.next

        return head
    }
}
