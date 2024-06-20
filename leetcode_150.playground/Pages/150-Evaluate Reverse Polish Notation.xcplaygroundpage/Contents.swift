import Foundation

//https://leetcode.com/problems/evaluate-reverse-polish-notation/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for item in tokens {
            if let num = Int(item) {
                stack.append(num)
            } else {
                var temp2: Int? = stack.popLast()
                var temp1: Int? = stack.popLast()
                switch item {
                    case "+":
                        stack.append((temp1 ?? 0) + (temp2 ?? 0))
                    case "-":
                        stack.append((temp1 ?? 0) - (temp2 ?? 0))
                    case "*":
                        stack.append((temp1 ?? 1) * (temp2 ?? 1))
                    case "/":
                        stack.append((temp1 ?? 1) / (temp2 ?? 1))
                    default:
                        ()
                }
            }
        }
        return stack.popLast() ?? 0
    }
}
