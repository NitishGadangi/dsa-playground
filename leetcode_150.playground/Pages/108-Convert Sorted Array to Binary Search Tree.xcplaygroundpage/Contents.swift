import Foundation

//https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/

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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return constructBST(nums, start: 0, end: nums.count - 1)
    }

    func constructBST(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end else { return nil }
        let idx = start + (end - start)/2
        let curval = nums[idx]
        let node = TreeNode(curval)
        node.left = constructBST(nums, start: start, end: idx - 1)
        node.right = constructBST(nums, start: idx + 1, end: end)
        return node
    }
}
