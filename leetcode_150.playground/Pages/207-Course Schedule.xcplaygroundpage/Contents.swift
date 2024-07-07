import Foundation

//https://leetcode.com/problems/course-schedule/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adj: [[Int]] = Array(repeating: [], count: numCourses)
        var inDegrees: [Int] =  Array(repeating: 0, count: numCourses)

        // create adj list and indegree
        for item in prerequisites {
            let course = item[0]
            let preReq = item[1]
            adj[preReq].append(course)
            inDegrees[course] += 1
        }

        var topoSort: [Int] = []
        var queue: [Int] = []
        // if indegree is 0. They have 0 dependencies
        for (course, degree) in inDegrees.enumerated() {
            if degree == 0 {
                queue.add(course)
            }
        }

        //bfs
        while queue.isNotEmpty {
            let curCourse = queue.pop()
            topoSort.append(curCourse)
            for dependent in adj[curCourse] {
                inDegrees[dependent] -= 1
                if inDegrees[dependent] == 0 {
                    queue.add(dependent)
                }
            }
        }

        return topoSort.count == numCourses
    }
}

// Queue on Array
extension Array {
    var isNotEmpty: Bool {
        get {
            return isEmpty == false
        }
    }

    mutating func add(_ newElement: Element) {
        append(newElement)
    }

    mutating func pop() -> Element {
        return remove(at: 0)
    }
}
