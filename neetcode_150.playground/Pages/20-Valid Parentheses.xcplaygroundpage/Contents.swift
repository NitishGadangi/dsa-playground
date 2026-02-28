import Foundation

//https://leetcode.com/problems/valid-parentheses/

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [String] = []
        for cur in s {
            if isOpenParanthesis(cur) {
                stack.append(String(cur))
            } else {
                let closedParan = getOpenParanthesis(cur)
                guard let topParan = stack.popLast(), topParan == closedParan else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }

    func isOpenParanthesis(_ item: Character) -> Bool {
        let openParns = ["{", "[", "("]
        return openParns.contains(String(item))
    }

    func getOpenParanthesis(_ item: Character) -> String {
        switch String(item) {
        case "}":
            return "{"
        case ")":
            return "("
        case "]":
            return "["
        default:
            return ""
        }
    }
}


