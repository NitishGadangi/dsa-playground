import Foundation

//https://algo.monster/liteproblems/305

class Solution {
    func numIslands2(m: Int, n: Int, positions: [[Int]]) -> [Int] {
        // m - rows, n - cols
        var grid = Array(repeating: Array(repeating: 0, count: n), count: m)
        let uf = UnionFind(size: m * n)
        var islands = 0
        var res: [Int] = []
        let dr = [0, 1, 0, -1]
        let dc = [1, 0, -1, 0]
        for pos in positions {
            let r = pos[0]
            let c = pos[1]
            if grid[r][c] == 1 {
                res.append(islands)
                continue
            }

            grid[r][c] = 1
            islands += 1
            for idx in 0..<4 {
                let rr = r + dr[idx]
                let cc = c + dc[idx]
                if rr >= 0 && rr < m && cc >= 0 && cc < n && grid[rr][cc] == 1 {
                    let curUfPos = getPos(r: r, c: c, cols: n)
                    let adjUfPos = getPos(r: rr, c: cc, cols: n)
                    if uf.union(curUfPos, adjUfPos) {
                        islands -= 1
                    }
                }
            }
            res.append(islands)
        }
        return res
    }

    func getPos(r: Int, c: Int, cols: Int) -> Int {
        return r * cols + c
    }
}

class UnionFind {
    private var parent: [Int]
    private var rank: [Int]

    init(size: Int) {
        parent = Array(repeating: -1, count: size)
        rank = Array(repeating: 1, count: size)
    }

    func find(_ x: Int) -> Int {
        let p = parent[x]
        if p == -1 { return x }
        let res = find(p)
        parent[x] = res
        return res
    }

    func union(_ x1: Int, _ x2: Int) -> Bool {
        let p1 = find(x1)
        let p2 = find(x2)
        if p1 == p2 { return false }
        let r1 = rank[p1]
        let r2 = rank[p2]
        if r1 > r2 {
            parent[p2] = p1
            rank[p1] += r2
        } else {
            parent[p1] = p2
            rank[p2] += r1
        }
        return true
    }
}
