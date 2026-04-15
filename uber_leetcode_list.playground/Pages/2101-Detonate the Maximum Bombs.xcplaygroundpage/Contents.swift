import Foundation

//https://leetcode.com/problems/detonate-the-maximum-bombs/description/

class Solution {
    func maximumDetonation(_ bombs: [[Int]]) -> Int {
        var adjList = Array(repeating: [Int](), count: bombs.count)
        for (idx, b) in bombs.enumerated() {
            let x = b[0]
            let y = b[1]
            let r = b[2]
            for nIdx in (idx + 1)..<bombs.count {
                let nbr = bombs[nIdx]
                let nx = nbr[0]
                let ny = nbr[1]
                let nr = nbr[2]
                let dist = distance((x, y), (nx, ny))
                if dist <= Double(r) {
                    adjList[idx].append(nIdx)
                }
                if dist <= Double(nr) {
                    adjList[nIdx].append(idx)
                }
            }
        }
        var res = 0
        for node in 0..<bombs.count {
            let cur = bfs(adjList, src: node)
            res = max(res, cur)
        }
        return res
    }

    func distance(_ p1: (x: Int, y: Int), _ p2: (x: Int, y: Int)) -> Double {
        let under: Double = pow(Double(p1.x - p2.x), 2) + pow(Double(p1.y - p2.y), 2)
        return sqrt(under)
    }

    func bfs(_ adjList: [[Int]], src: Int) -> Int {
        var visited = Array(repeating: false, count: adjList.count)
        visited[src] = true
        var res = 0
        var queue: [Int] = [src]
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            res += 1
            for nbr in adjList[cur] where visited[nbr] == false {
                visited[nbr] = true
                queue.append(nbr)
            }
        }
        return res
    }
}

