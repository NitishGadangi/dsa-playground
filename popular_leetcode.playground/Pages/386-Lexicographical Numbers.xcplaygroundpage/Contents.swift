import Foundation

//https://leetcode.com/problems/lexicographical-numbers/description/

class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        var curNum = 1
        var res: [Int] = []
        for _ in 0..<n {
            res.append(curNum)
            if curNum * 10 <= n {
                curNum = curNum * 10
            } else {
                while (curNum % 10 == 9) || (curNum >= n) {
                    curNum = curNum / 10
                }
                curNum += 1
            }
        }
        return res
    }
}
