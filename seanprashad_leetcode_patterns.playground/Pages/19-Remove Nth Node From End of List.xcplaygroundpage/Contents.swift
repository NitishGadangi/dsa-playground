import Foundation

//https://leetcode.com/problems/remove-nth-node-from-end-of-lis

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var count = n
        var second: ListNode? = head
        while count > 0 && second != nil {
            second = second?.next
            count -= 1
        }
        guard count == 0 else { return head }
        guard second != nil else { return head?.next }
        var first: ListNode? = head
        while second?.next != nil {
            second = second?.next
            first = first?.next
        }
        first?.next = first?.next?.next
        return head
    }
}
