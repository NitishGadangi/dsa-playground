import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-list/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = head
        var cur: ListNode? = head?.next
        while cur != nil {
            if prev?.val != cur?.val {
                prev?.next = cur
                prev = cur
            }
            cur = cur?.next
        }
        prev?.next = nil
        return head
    }
}
