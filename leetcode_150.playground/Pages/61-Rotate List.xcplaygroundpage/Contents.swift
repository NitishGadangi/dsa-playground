import Foundation

//https://leetcode.com/problems/rotate-list/description/?envType=study-plan-v2&envId=top-interview-150

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else { return nil }
        var count = 0
        var test = head
        while test != nil {
            test = test?.next
            count += 1
        }
        var k = k % count

        guard k > 0 else { return head }

        var end = head
        for _ in 0..<k {
            end = end?.next
        }

        var cur = head
        while end?.next != nil {
            cur = cur?.next
            end = end?.next
        }
        var root = cur?.next
        cur?.next = nil
        end?.next = head
        return root
    }
}
