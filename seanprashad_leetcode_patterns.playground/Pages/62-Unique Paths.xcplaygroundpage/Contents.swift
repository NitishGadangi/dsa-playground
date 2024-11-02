import Foundation

//https://leetcode.com/problems/unique-paths/

class Solution {
    var memoMap: [String: Int] = [:]
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        return paths(rows: m, cols: n, r: 0, c: 0)
    }
    
    func paths(rows: Int, cols: Int, r: Int, c: Int) -> Int {
        guard r >= 0 && r < rows && c >= 0 && c < cols else { return 0 }
        if r == rows - 1 && c == cols - 1 { return 1 }
        let key = "\(r)-\(c)"
        if let res = memoMap[key] {
            return res
        }
        let right = paths(rows: rows, cols: cols, r: r , c: c + 1)
        let down = paths(rows: rows, cols: cols, r: r + 1, c: c)
        let res = right + down
        memoMap[key] = res
        return res
    }
}
