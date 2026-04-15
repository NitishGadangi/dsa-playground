import Foundation

// https://leetcode.com/problems/find-the-closest-palindrome/

// possible palindromes with given number
// - The largest palindrome with one fewer digit: 10^(l-1) - 1 (like 99 for a 3-digit input)
// - The smallest palindrome with one more digit: 10^l + 1 (like 1001 for a 3-digit input)
// - Mirror the left half as-is
// - Decrement the left half by 1, then mirror it
// - Increment the left half by 1, then mirror it


class Solution {
    func nearestPalindromic(_ n: String) -> String {
        var num = Int(n)!
        let pals = possiblePalindromes(n)
        var res = Int.max
        for pNum in pals {
            let extDist = abs(res - num)
            let curDist = abs(pNum - num)
            if curDist < extDist {
                res = pNum
            } else if curDist == extDist {
                res = min(res, pNum)
            }
        }
        return String(res)
    }

    func possiblePalindromes(_ str: String) -> [Int] {
        var num = Int(str)!
        var res = Set<Int>()

        // edge case when num is 999, or 1001. We go up or down by size
        let n = str.count
        let pal1 = pow(Double(10), Double(n - 1)) - 1
        res.insert(Int(pal1))
        let pal2 = pow(Double(10), Double(n)) + 1
        res.insert(Int(pal2))

        // mirroring
        let prefixStr = str.prefix((n + 1)/2)
        let prefixNum = Int(prefixStr)!
        [prefixNum - 1, prefixNum, prefixNum + 1].forEach { prefix in
            let reflection = String(String(prefix).prefix(n/2).reversed())
            let curPal = Int("\(prefix)\(reflection)")!
            res.insert(curPal)
        }
        res.remove(num)
        return res.sorted()
    }
}

