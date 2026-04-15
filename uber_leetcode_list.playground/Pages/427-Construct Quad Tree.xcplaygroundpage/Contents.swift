import Foundation

//

public class Node {
    public var val: Bool
    public var isLeaf: Bool
    public var topLeft: Node?
    public var topRight: Node?
    public var bottomLeft: Node?
    public var bottomRight: Node?
    public init(_ val: Bool, _ isLeaf: Bool) {
        self.val = val
        self.isLeaf = isLeaf
        self.topLeft = nil
        self.topRight = nil
        self.bottomLeft = nil
        self.bottomRight = nil
    }
}

class Solution {
    func construct(_ grid: [[Int]]) -> Node? {
        return dfs(grid, count: grid.count, r: 0, c: 0)
    }

    func dfs(_ grid: [[Int]], count: Int, r: Int, c: Int) -> Node {
        if count == 1 {
            return Node(grid[r][c] == 1, true)
        }
        var mid = count/2
        let topLeft = dfs(grid, count: mid, r: r, c: c)
        let topRight = dfs(grid, count: mid, r: r, c: c + mid)
        let bottomLeft = dfs(grid, count: mid, r: r + mid, c: c)
        let bottomRight = dfs(grid, count: mid, r: r + mid, c: c + mid)

        if topLeft.isLeaf && topRight.isLeaf && bottomLeft.isLeaf && bottomRight.isLeaf
            && (topLeft.val == topRight.val) && (topLeft.val == bottomLeft.val) && (topLeft.val == bottomRight.val) {
            return Node(topLeft.val, true)
        }

        var res = Node(false, false)
        res.topLeft = topLeft
        res.topRight = topRight
        res.bottomLeft = bottomLeft
        res.bottomRight = bottomRight
        return res
    }
}

class SolutionSlow {
    func construct(_ grid: [[Int]]) -> Node? {
        return dfs(grid, count: grid.count, r: 0, c: 0)
    }

    func dfs(_ grid: [[Int]], count: Int, r: Int, c: Int) -> Node {
        if isAllSame(grid, count: count, r: r, c: c) {
            return Node(grid[r][c] == 1, true)
        }
        var mid = count/2
        var res = Node(false, false)
        res.topLeft = dfs(grid, count: mid, r: r, c: c)
        res.topRight = dfs(grid, count: mid, r: r, c: c + mid)
        res.bottomLeft = dfs(grid, count: mid, r: r + mid, c: c)
        res.bottomRight = dfs(grid, count: mid, r: r + mid, c: c + mid)
        return res
    }

    func isAllSame(_ grid: [[Int]], count: Int, r: Int, c: Int) -> Bool {
        let first = grid[r][c]
        for dr in 0..<count {
            for dc in 0..<count {
                if grid[r + dr][c + dc] != first {
                    return false
                }
            }
        }
        return true
    }
}


