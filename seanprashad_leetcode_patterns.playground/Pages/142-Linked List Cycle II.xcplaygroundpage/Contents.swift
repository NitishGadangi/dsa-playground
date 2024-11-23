import Foundation

//https://leetcode.com/problems/linked-list-cycle-ii/

//https://medium.com/@zephyr.ventum/floyds-tortoise-and-hare-cycle-finding-algorithm-my-over-explanation-5631c5ce71d7

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var head = head
        var slow: ListNode? = head
        var fast: ListNode? = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast { break }
        }
        if fast == nil || fast?.next == nil { return nil }
        while head !== slow {
            head = head?.next
            slow = slow?.next
        }
        return slow
    }
}
