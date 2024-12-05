import Foundation

//https://leetcode.com/problems/jump-game-iii

class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        let n = arr.count
        var adjList: [[Int]] = Array(repeating: [], count: n)
        for (x, dx) in arr.enumerated() {
            let xx1 = x + dx
            if xx1 >= 0 && xx1 < n {
                adjList[x].append(xx1)
            }
            let xx2 = x - dx
            if xx2 >= 0 && xx2 < n {
                adjList[x].append(xx2)
            }
        }
        
        var queue: [Int] = [start]
        var vis: [Bool] = Array(repeating: false, count: n)
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            vis[cur] = true
            for nbr in adjList[cur] {
                if nbr == cur {
                    return true
                }
                if !vis[nbr] {
                    queue.append(nbr)
                }
            }
        }
        return false
    }
}

let res = Solution().canReach([3,0,2,1,2], 2)
