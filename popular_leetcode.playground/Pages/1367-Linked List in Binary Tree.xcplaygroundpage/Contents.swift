import Foundation

//https://leetcode.com/problems/linked-list-in-binary-tree

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let root else { return false }
        return traverse(head: head, root: root)
    }

    func traverse(head: ListNode?, root: TreeNode?) -> Bool {
        guard let root else { return false }
        if checkNodes(head: head, root: root) {
            return true
        }
        return traverse(head: head, root: root.left) || traverse(head: head, root: root.right)
    }

    func checkNodes(head: ListNode?, root: TreeNode?) -> Bool {
        guard let head else { return true }
        guard let root else { return false }
        guard head.val == root.val else { return false }
        return checkNodes(head: head.next, root: root.left) || checkNodes(head: head.next, root: root.right)
    }
}
