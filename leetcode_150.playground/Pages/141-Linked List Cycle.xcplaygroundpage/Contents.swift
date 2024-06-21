import Foundation

//https://leetcode.com/problems/linked-list-cycle/description/?envType=study-plan-v2&envId=top-interview-150
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        while (slow != nil) && (fast != nil) && (fast?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
            if (slow?.val == fast?.val) {
                return true
            }
        }
        return false
    }
}
