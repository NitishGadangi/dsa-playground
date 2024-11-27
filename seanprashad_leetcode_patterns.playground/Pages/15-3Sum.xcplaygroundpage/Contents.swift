import Foundation

//https://leetcode.com/problems/3sum/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var res: Set<[Int]> = []
        for idx in 0..<(nums.count - 2) {
            let firstNum = nums[idx]
            var sec = idx + 1
            var trd = nums.count - 1
            var target = -1 * firstNum
            while sec < trd {
                let secNum = nums[sec]
                let trdNum = nums[trd]
                let curSum = secNum + trdNum
                if curSum < target {
                    sec += 1
                } else if curSum > target {
                    trd -= 1
                } else {
                    res.insert([firstNum, secNum, trdNum])
                    sec += 1
                    trd -= 1
                }
            }
        }
        return Array(res)
    }
}
