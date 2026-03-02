import Foundation

//https://leetcode.com/problems/course-schedule-ii/description/

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var topoSort: [Int] = []
        var adjList: [[Int]] = Array(repeating: [], count: numCourses)
        var inDegree: [Int] = Array(repeating: 0, count: numCourses)
        for preReq in prerequisites {
            let course = preReq[0]
            let dep = preReq[1]
            adjList[dep].append(course)
            inDegree[course] += 1
        }
        var queue: [Int] = []
        for (idx, deg) in inDegree.enumerated() {
            if deg == 0 {
                queue.append(idx)
            }
        }
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            topoSort.append(cur)
            for nbr in adjList[cur] {
                inDegree[nbr] -= 1
                if inDegree[nbr] == 0 {
                    queue.append(nbr)
                }
            }
        }
        return topoSort.count == numCourses ? topoSort : []
    }
}
