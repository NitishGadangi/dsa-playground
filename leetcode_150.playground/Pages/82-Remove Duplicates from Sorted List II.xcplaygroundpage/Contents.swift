import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/?envType=study-plan-v2&envId=top-interview-150

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head else { return nil }
        let root = ListNode(-1, head)
        var prev: ListNode? = root
        var cur: ListNode? = head
        while cur != nil {
            if cur?.val == cur?.next?.val {
                var temp = cur
                while temp?.val == cur?.val {
                    temp = temp?.next
                }
                prev?.next = temp
                cur = temp
            } else {
                prev = cur
                cur = cur?.next
            }
        }
        return root.next
    }
}
