import Foundation

// https://leetcode.com/problems/number-of-adjacent-elements-with-the-same-color/

class Solution {
    func colorTheArray(_ n: Int, _ queries: [[Int]]) -> [Int] {
        var colArr = Array(repeating: 0, count: n)
        var pairCnt = 0
        var res: [Int] = []
        for q in queries {
            let idx = q[0]
            let newCol = q[1]
            let curCol = colArr[idx]
            if curCol == newCol {
                res.append(pairCnt)
                continue
            }
            if curCol != 0 {
                if idx - 1 >= 0 && colArr[idx - 1] == curCol {
                    pairCnt -= 1
                }
                if idx + 1 < n && colArr[idx + 1] == curCol {
                    pairCnt -= 1
                }
            }
            colArr[idx] = newCol
            if idx - 1 >= 0 && colArr[idx - 1] == newCol {
                pairCnt += 1
            }
            if idx + 1 < n && colArr[idx + 1] == newCol {
                pairCnt += 1
            }
            res.append(pairCnt)
        }
        return res
    }
}
