import Foundation

//https://leetcode.com/problems/time-needed-to-inform-all-employees

class Solution {
    struct Empl {
        let id: Int
        let time: Int
    }
    
    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var adjList: [[Int]] = Array(repeating: [], count: n)
        for (emp, man) in manager.enumerated() {
            guard emp != headID else { continue }
            adjList[man].append(emp)
        }
        var res = 0
        var queue: [Empl] = [Empl(id: headID, time: 0)]
        var vis: [Bool] = Array(repeating: false, count: n)
        while !queue.isEmpty {
            let emp = queue.removeFirst()
            let time = emp.time
            res = max(res, time)
            vis[emp.id] = true
            for nbr in adjList[emp.id] {
                if !vis[nbr] {
                    queue.append(Empl(id: nbr, time: time + informTime[emp.id]))
                }
            }
        }
        return res
    }
}
