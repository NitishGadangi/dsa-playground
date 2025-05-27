import Foundation

//https://leetcode.com/problems/possible-bipartition/

class Solution {
    enum NodeColor {
        case none
        case red
        case blue

        var opposite: NodeColor {
            switch self {
            case .none:
                return .none
            case .red:
                return .blue
            case .blue:
                return .red
            }
        }
    }

    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var colors: [NodeColor] = Array(repeating: .none, count: n + 1)
        var adjList: [[Int]] = Array(repeating: [], count: n + 1)
        for item in dislikes {
            let from = item[0]
            let to = item[1]
            adjList[from].append(to)
            adjList[to].append(from)
        }
        for idx in 1...n {
            guard colors[idx] == .none else { continue }
            colors[idx] = .red
            // start BFS
            var queue: [Int] = [idx]
            while !queue.isEmpty {
                let cur = queue.removeFirst()
                let curCol = colors[cur]
                for nbr in adjList[cur] {
                    if colors[nbr] == .none {
                        colors[nbr] = curCol.opposite
                        queue.append(nbr)
                    } else if colors[nbr] == curCol {
                        return false
                    }
                }
            }
        }
        return true
    }
}
