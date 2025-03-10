import Foundation

//https://leetcode.com/problems/course-schedule/

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjList: [[Int]] = Array(repeating: [], count: numCourses)
        var inDegree: [Int] = Array(repeating: 0, count: numCourses)

        for item in prerequisites {
            let course = item[0]
            let preReq = item[1]
            adjList[preReq].append(course)
            inDegree[course] += 1
        }

        var queue: [Int] = []
        for (idx, deg) in inDegree.enumerated() {
            if deg == 0 {
                queue.append(idx)
            }
        }

        var topoSorted: [Int] = []
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            topoSorted.append(cur)
            for nbr in adjList[cur] {
                inDegree[nbr] -= 1
                if inDegree[nbr] == 0 {
                    queue.append(nbr)
                }
            }
        }

        return topoSorted.count == numCourses
    }
}
