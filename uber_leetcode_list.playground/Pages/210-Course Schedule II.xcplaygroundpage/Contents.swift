import Foundation

//https://leetcode.com/problems/course-schedule-ii/

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adjList: [[Int]] = Array(repeating: [], count: numCourses)
        var inDegree: [Int] = Array(repeating: 0, count: numCourses)
        for req in prerequisites {
            let course = req[0]
            let dep = req[1]
            adjList[dep].append(course)
            inDegree[course] += 1
        }
        var queue: [Int] = []
        for (idx, deg) in inDegree.enumerated() {
            guard deg == 0 else { continue }
            queue.append(idx)
        }
        var res: [Int] = []
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            res.append(cur)
            for nbr in adjList[cur] {
                inDegree[nbr] -= 1
                if inDegree[nbr] == 0 {
                    queue.append(nbr)
                }
            }
        }
        if res.count == numCourses {
            return res
        }
        return []
    }
}
