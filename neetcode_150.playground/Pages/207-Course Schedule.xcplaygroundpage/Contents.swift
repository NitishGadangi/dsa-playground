import Foundation

//https://leetcode.com/problems/course-schedule/

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var inDegree: [Int] = Array(repeating: 0, count: numCourses)
        var adjList: [[Int]] = Array(repeating: [], count: numCourses)
        for prereq in prerequisites {
            let course = prereq[0]
            let dep = prereq[1]
            adjList[dep].append(course)
            inDegree[course] += 1
        }
        var queue: [Int] = []
        for (idx, deg) in inDegree.enumerated() {
            if deg == 0 {
                queue.append(idx)
            }
        }
        var topoSort: [Int] = []
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
        return topoSort.count == numCourses
    }
}
