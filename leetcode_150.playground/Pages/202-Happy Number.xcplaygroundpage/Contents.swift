import Foundation

//https://leetcode.com/problems/happy-number/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var visited = Set<Int>()
        var num = n
        while visited.contains(num) == false {
            visited.insert(num)
            var next = digitsSquared(num: num)
            if next == 1 {
                return true
            }
            num = next
        }
        return false
    }

    func digitsSquared(num: Int) -> Int {
        var sum = 0
        while num > 0 {
            let digit = num % 10
            sum += digit * digit
            num = num / 10
        }
        return sum
    }
}
