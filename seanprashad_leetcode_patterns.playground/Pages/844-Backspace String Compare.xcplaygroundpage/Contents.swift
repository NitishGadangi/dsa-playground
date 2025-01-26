import Foundation

//https://leetcode.com/problems/backspace-string-compare/

class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        let sParsed = parseString(str: s)
        let tParsed = parseString(str: t)
        return sParsed == tParsed
    }
    
    func parseString(str: String) -> String {
        var stack: [String] = []
        for item in str {
            if String(item) == "#" {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(String(item))
            }
        }
        return stack.joined()
    }
}
