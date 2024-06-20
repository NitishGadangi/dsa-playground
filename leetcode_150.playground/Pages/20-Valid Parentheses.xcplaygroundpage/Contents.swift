import Foundation

//https://leetcode.com/problems/valid-parentheses/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func isValid(_ s: String) -> Bool {
        var strArr = Array(s)
        var stack: [String.Element] = []
        for item in strArr {
            if isOpenPranthesis(str: item) {
                stack.append(item)
            } else {
                let openParam = getOpenParenthesis(for: item)
                let prevItem = stack.popLast()
                guard let prevItem, String(prevItem) == openParam else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }

    func isOpenPranthesis(str: String.Element) -> Bool {
        let openPranthesis = ["(", "{", "["]
        return openPranthesis.contains("\(str)")
    }

    func getOpenParenthesis(for str: String.Element) -> String {
        switch str {
            case ")":
                return "("
            case "}":
                return "{"
            case "]":
                return "["
            default:
                return ""
        }
    }
}


