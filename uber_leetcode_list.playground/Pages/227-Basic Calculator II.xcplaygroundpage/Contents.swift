import Foundation

// https://leetcode.com/problems/basic-calculator-ii/description/

// case 1: + or - : push number with sign
// case 2: * or / : mul or divide numbers and push

class Solution {
    func calculate(_ s: String) -> Int {
        var sArr = Array(s)
        var stack: [Int] = []
        var curOp: Character = "+"
        var curNum = 0
        for (idx, ch) in sArr.enumerated() {
            if ch.isNumber {
                curNum = curNum * 10 + ch.wholeNumberValue!
            }
            if idx == s.count - 1 || ch.isOperator {
                switch curOp {
                case "+":
                    stack.append(curNum)
                case "-":
                    stack.append(-curNum)
                case "*":
                    if !stack.isEmpty {
                        let last = stack.removeLast()
                        stack.append(last * curNum)
                    }
                case "/":
                    if !stack.isEmpty {
                        let last = stack.removeLast()
                        stack.append(last / curNum)
                    }
                default:
                    continue
                }
                curNum = 0
                curOp = ch
            }
        }
        var res = 0
        for num in stack {
            res += num
        }
        return res
    }
}

extension Character {
    var isOperator: Bool {
        ["*", "/", "+", "-"].contains(self)
    }
}
