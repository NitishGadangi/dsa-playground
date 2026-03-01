import Foundation

//https://leetcode.com/problems/evaluate-reverse-polish-notation/description/

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []

        for tkn in tokens {
            if let num = Int(tkn) {
                stack.append(num)
            } else {
                let firstNum = stack.removeLast()
                let seconNum = stack.removeLast()
                let eval = calculateEvan(first: seconNum, second: firstNum, token: tkn)
                stack.append(eval)
            }
        }
        return stack.last ?? 0
    }

    func calculateEvan(first: Int, second: Int, token: String) -> Int {
        switch token {
        case "+":
            return first + second
        case "*":
            return first * second
        case "-":
            return first - second
        case "/":
            return first/second
        default:
            return 0
        }
    }
}
