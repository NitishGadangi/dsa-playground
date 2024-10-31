import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow: ListNode? = head
        var fast: ListNode? = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        var midAfterRev = reverseList(head: slow?.next)
        slow?.next = nil
        var start: ListNode? = head
        while midAfterRev != nil {
            guard start?.val == midAfterRev?.val else { return false }
            start = start?.next
            midAfterRev = midAfterRev?.next
        }
        return true
    }
    
    func reverseList(head: ListNode?) -> ListNode? {
        var cur: ListNode? = head
        var prev: ListNode? = nil
        while cur != nil {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        return prev
    }
}
