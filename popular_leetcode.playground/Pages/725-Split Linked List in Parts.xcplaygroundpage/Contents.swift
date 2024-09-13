import Foundation

//https://leetcode.com/problems/split-linked-list-in-parts

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        // calculate total length
        var size = 0
        var curNode = head
        while curNode != nil {
            curNode = curNode?.next
            size += 1
        }

        // calculate each split size + extra rem
        let splitSize = size/k
        var rem = size % k

        // create res
        curNode = head
        var prevNode = head
        var res: [ListNode?] = []
        for _ in 0..<k {
            guard curNode != nil else {
                res.append(nil)
                continue
            }
            var curSplitSize = splitSize + (rem > 0 ? 1 : 0)
            rem -= 1
            res.append(curNode)
            while curNode != nil && curSplitSize > 0 {
                prevNode = curNode
                curNode = curNode?.next
                curSplitSize -= 1
            }
            prevNode?.next = nil
        }
        return res
    }
}
