import Foundation

//

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let head else { return nil }
        guard let second = head.next else { return head }
        let next = second.next
        second.next = head
        head.next = swapPairs(next)
        return second
    }
}
