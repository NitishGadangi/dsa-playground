import Foundation

//https://leetcode.com/problems/reverse-linked-list-ii/description/?envType=study-plan-v2&envId=top-interview-150

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var idx = 1
        var root: ListNode? = nil
        var prevNode: ListNode? = nil
        var curNode: ListNode? = head
        while idx < left {
            root = root ?? curNode
            prevNode = curNode
            curNode = curNode?.next
            idx += 1
        }

        // reversing
        var revPrev: ListNode? = nil
        var revCur: ListNode? = curNode
        while idx <= right {
            let temp = revCur?.next
            revCur?.next = revPrev
            revPrev = revCur
            revCur = temp
            idx += 1
        }
        root = root ?? revPrev
        prevNode?.next = revPrev
        curNode?.next = revCur
        return root
    }
}
