import Foundation

//https://leetcode.com/problems/reverse-linked-list-ii/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard left < right else { return head }
        var idx = 1
        var root: ListNode? = nil
        var prev: ListNode? = nil
        var cur: ListNode? = head
        
        while idx < left {
            idx += 1
            root = root ?? cur
            prev = cur
            cur = cur?.next
        }
        
        var revPrev: ListNode? = nil
        var revCur: ListNode? = cur
        while idx <= right {
            idx += 1
            let next = revCur?.next
            revCur?.next = revPrev
            revPrev = revCur
            revCur = next
        }
        root = root ?? revPrev
        prev?.next = revPrev
        cur?.next = revCur
        return root
    }
}

