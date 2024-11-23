import Foundation

//https://leetcode.com/problems/odd-even-linked-list/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard let head, let next = head.next else { return head }
        var odd: ListNode? = head
        var even: ListNode? = next
        let firstEven = even
        while even != nil && even?.next != nil {
            odd?.next = odd?.next?.next
            even?.next = even?.next?.next
            odd = odd?.next
            even = even?.next
        }
        odd?.next = firstEven
        return head
    }
    
    func oddEvenListBig(_ head: ListNode?) -> ListNode? {
        var firstEven: ListNode? = nil
        var even: ListNode? = nil
        var odd: ListNode? = nil
        var cur: ListNode? = head
        var idx = 1
        while cur != nil {
            if idx % 2 == 0 {
                if even != nil {
                    even?.next = cur
                    even = even?.next
                } else {
                    even = cur
                    firstEven = cur
                }
            } else {
                if odd != nil {
                    odd?.next = cur
                    odd = odd?.next
                } else {
                    odd = cur
                }
            }
            cur = cur?.next
            idx += 1
        }
        even?.next = nil
        odd?.next = firstEven
        return head
    }
}
