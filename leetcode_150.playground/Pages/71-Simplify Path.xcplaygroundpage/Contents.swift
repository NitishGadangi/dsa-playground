import Foundation

//https://leetcode.com/problems/simplify-path/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func simplifyPath(_ path: String) -> String {
        var dirs = path.components(separatedBy: "/")
        var stack = [String]()
        for dir in dirs {
            if (dir == "") || (dir == ".") { continue }
            else if dir == ".." {
                stack.popLast()
            } else {
                stack.append(dir)
            }
        }
        return "/" + stack.joined(separator: "/")
    }
}
