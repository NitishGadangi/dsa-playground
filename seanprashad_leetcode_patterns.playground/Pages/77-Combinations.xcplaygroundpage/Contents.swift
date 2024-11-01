import Foundation

//https://leetcode.com/problems/combinations/

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        backtrack(n: n, k: k, res: &res, temp: &temp, start: 1)
        return res
    }
    
    func backtrack(n: Int, k: Int, res: inout [[Int]], temp: inout [Int], start: Int) {
        if temp.count == k {
            res.append(temp)
            return
        }
        guard start <= n else { return }
        for num in start...n {
            temp.append(num)
            backtrack(n: n, k: k, res: &res, temp: &temp, start: num + 1)
            temp.removeLast()
        }
    }
}
