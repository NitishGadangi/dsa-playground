import Foundation

//https://leetcode.com/problems/course-schedule/

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjList: [[Int]] = Array(repeating: [], count: numCourses)
        var indegree: [Int] = Array(repeating: 0, count: numCourses)
        
        // fill adjList & inDegree
        for item in prerequisites {
            let course = item[0]
            let preReq = item[1]
            adjList[preReq].append(course)
            indegree[course] += 1
        }
        
        var queue: [Int] = []
        for (idx, deg) in indegree.enumerated() {
            if deg == 0 {
                queue.append(idx)
            }
        }
        var topoSort: [Int] = []
        while !queue.isEmpty {
            let course = queue.removeFirst()
            topoSort.append(course)
            for dep in adjList[course] {
                indegree[dep] -= 1
                if indegree[dep] == 0 {
                    queue.append(dep)
                }
            }
        }
        
        return topoSort.count == numCourses
    }
}
