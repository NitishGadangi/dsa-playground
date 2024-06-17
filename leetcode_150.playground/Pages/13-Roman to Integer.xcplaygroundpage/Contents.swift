import Foundation

//https://leetcode.com/problems/roman-to-integer/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func romanToInt(_ s: String) -> Int {
        var res: Int = 0
        for idx in stride(from: 0, to: s.count, by: 1) {
            let charArr = Array(s)
            let curChar = charArr[idx]
            let curRomanVal = RomanNumber(rawValue: "\(curChar)")?.decimalValue
            guard let curRomanVal else {
                continue
            }

            // for handling IX, IV etc...
            if ((idx + 1) < charArr.count),
               let nextRomanVal = RomanNumber(rawValue: "\(charArr[idx + 1])")?.decimalValue,
               curRomanVal < nextRomanVal {
                continue
            }

            guard idx > 0 else {
                res += curRomanVal
                continue
            }

            // final parse
            let prevChar = charArr[idx - 1]
            let prevRomanVal = RomanNumber(rawValue: "\(prevChar)")?.decimalValue ?? Int.max

            if prevRomanVal < curRomanVal {
                res += curRomanVal - prevRomanVal
            } else {
                res += curRomanVal
            }
        }
        return res
    }

    enum RomanNumber: String {
        case I
        case V
        case X
        case L
        case C
        case D
        case M

        var decimalValue: Int {
            switch self {
                case .I:
                    return 1
                case .V:
                    return 5
                case .X:
                    return 10
                case .L:
                    return 50
                case .C:
                    return 100
                case .D:
                    return 500
                case .M:
                    return 1000
            }
        }
    }
}

let test = Solution()
test.romanToInt("MCMXCIV")
