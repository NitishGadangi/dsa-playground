import Foundation

//https://leetcode.com/problems/palindrome-number/

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        return x == getReversedNumber(num: x)
    }

    func getReversedNumber(num: Int) -> Int {
        var num = num
        var res: Int = 0
        while num > 0 {
            res *= 10
            res += num % 10
            num /= 10
        }
        return res
    }
}
