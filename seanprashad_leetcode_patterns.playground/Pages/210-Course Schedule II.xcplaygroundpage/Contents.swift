import Foundation

//https://leetcode.com/problems/course-schedule-ii/

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adjList: [[Int]] = Array(repeating: [], count: numCourses)
        var indegree: [Int] = Array(repeating: 0, count: numCourses)
        
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
            let curCourse = queue.removeFirst()
            topoSort.append(curCourse)
            for depCourse in adjList[curCourse] {
                indegree[depCourse] -= 1
                if indegree[depCourse] == 0 {
                    queue.append(depCourse)
                }
            }
        }
        
        return topoSort.count == numCourses ? topoSort : []
    }
}
