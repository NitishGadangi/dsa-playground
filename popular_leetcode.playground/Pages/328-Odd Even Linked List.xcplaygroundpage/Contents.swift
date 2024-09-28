import Foundation

//https://leetcode.com/problems/odd-even-linked-list

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var firstEven: ListNode? = nil
        var even: ListNode? = nil
        var odd: ListNode? = head
        var prevOdd: ListNode? = nil
        while odd != nil {
            if even == nil {
                even = odd?.next
                firstEven = even
            } else {
                even?.next = odd?.next
                even = even?.next
            }
            prevOdd = odd
            odd?.next = odd?.next?.next
            odd = odd?.next
        }
        prevOdd?.next = firstEven
        return head
    }
}
