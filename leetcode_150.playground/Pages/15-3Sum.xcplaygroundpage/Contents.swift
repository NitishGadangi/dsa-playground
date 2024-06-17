import Foundation

//https://leetcode.com/problems/3sum/description/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted { left, right in
            left < right
        }
        var res: [[Int]] = []
        var idx = 0
        while idx < sortedNums.count {
            let num = sortedNums[idx]
            let targetSum = -1 * num
            var start = idx + 1
            var end = sortedNums.count - 1
            while start < end {
                let left = sortedNums[start]
                let right = sortedNums[end]
                let curSum = left + right
                if curSum < targetSum {
                    start += 1
                } else if curSum > targetSum {
                    end -= 1
                } else {
                    res.append([num, left, right])

                    // skip duplicates
                    while (start < end) && (left == sortedNums[start]) {
                        start += 1
                    }
                    while (end > start) && (right == sortedNums[end]) {
                        end -= 1
                    }
                }
            }

            // skip duplicates
            while (idx < sortedNums.count) && num == sortedNums[idx] {
                idx += 1
            }
        }
        return Array(res)
    }
}


class AlternateSolution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted { left, right in
            left < right
        }
        var res = Set<[Int]>()
        for (idx, num) in sortedNums.enumerated() {
            let targetSum = -1 * num
            var start = idx + 1
            var end = sortedNums.count - 1
            while start < end {
                let left = sortedNums[start]
                let right = sortedNums[end]
                let curSum = left + right
                if curSum < targetSum {
                    start += 1
                } else if curSum > targetSum {
                    end -= 1
                } else {
                    res.insert([num, left, right])
                    start += 1
                    end -= 1
                }
            }
        }
        return Array(res)
    }
}
