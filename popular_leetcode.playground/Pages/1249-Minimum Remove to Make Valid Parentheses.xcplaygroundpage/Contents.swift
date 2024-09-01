import Foundation

//https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/description/

class Solution {
    let OPEN_BRACE = "("
    let CLOSE_BRACE = ")"

    func minRemoveToMakeValid(_ s: String) -> String {
        // remove unbalanced closed paranthesis
        var ansFirst: String = ""
        var open = 0
        for char in s {
            var curStr = String(char)
            if (curStr != OPEN_BRACE) && (curStr != CLOSE_BRACE) {
                ansFirst += curStr
            } else if curStr == OPEN_BRACE {
                ansFirst += curStr
                open += 1
            } else if open > 0 { // case when its closed bracket. checking if there are matching open brackets
                ansFirst += curStr
                open -= 1
            }
        }

        // remove unbalanced open paranthesis - must iterate from back
        var ans = ""
        var closed = 0
        for char in Array(ansFirst).reversed() {
            var curStr = String(char)
            if (curStr != OPEN_BRACE) && (curStr != CLOSE_BRACE) {
                ans = curStr + ans
            } else if curStr == CLOSE_BRACE {
                ans = curStr + ans
                closed += 1
            } else if closed > 0 {
                ans = curStr + ans
                closed -= 1
            }
        }

        return ans
    }
}
