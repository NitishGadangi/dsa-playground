import Foundation

//https://leetcode.com/problems/combinations/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    var res: Set<[Int]> = []
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        backtrack(n: n, k: k, temp: [], idx: 1)
        return Array(res)
    }

    func backtrack(n: Int, k: Int, temp: [Int], idx: Int) {
        if temp.count == k {
            res.insert(temp)
            return
        }

        var temp = temp
        for num in idx...n {
            temp.append(num)
            backtrack(n: n, k: k, temp: temp, idx: idx + 1)
            temp.remove(at: temp.count - 1)
        }
    }
}

