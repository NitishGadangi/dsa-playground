import Foundation

//https://leetcode.com/problems/integer-to-roman/description/

class Solution {
    func intToRoman(_ num: Int) -> String {
        let symbols: [String] = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let values: [Int] = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        var res = ""
        var numCopy = num
        for idx in stride(from: 0, to: symbols.count, by: 1) {
            let curSymbol = symbols[idx]
            let curVal = values[idx]
            while numCopy >= curVal {
                numCopy -= curVal
                res.append(curSymbol)
            }
        }
        return res
    }
}
