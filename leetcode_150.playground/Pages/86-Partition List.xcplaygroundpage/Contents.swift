import Foundation

//https://leetcode.com/problems/partition-list/?envType=study-plan-v2&envId=top-interview-150

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var lessThanArr: [ListNode?] = []
        var greatThanArr: [ListNode?] = []

        var cur = head
        while cur != nil {
            guard let val = cur?.val else { break }
            if val < x {
                lessThanArr.append(cur)
            } else {
                greatThanArr.append(cur)
            }
            cur = cur?.next
        }

        let dummy = ListNode()
        var temp: ListNode? = dummy
        for node in lessThanArr {
            node?.next = nil
            temp?.next = node
            temp = temp?.next
        }
        for node in greatThanArr {
            node?.next = nil
            temp?.next = node
            temp = temp?.next
        }
        return dummy.next
    }
}

class AlternateSolution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let dummy = ListNode(Int.min, head)
        var start: ListNode? = dummy
        var endPrev: ListNode? = nil
        var end = head
        while end != nil {
            guard let curVal = end?.val else { break }
            let nextNode = end?.next
            if curVal < x {
                end?.next = start?.next
                start?.next = end
                start = start?.next
                endPrev?.next = nextNode
            } else {
                endPrev = end
            }
            end = nextNode
        }
        return dummy.next
    }
}
