import Foundation

//https://leetcode.com/problems/two-sum/description/

class Solution {

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var targetMap: [Int: Int] = [:] // target - index

        for (idx, item) in nums.enumerated() {
            if let targetIdx = targetMap[item] {
                return [idx, targetIdx]
            } else {
                targetMap[target - item] = idx
            }
        }

        return []
    }


    func twoSumAlternate(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [Int]()
        for (idx, item) in nums.enumerated() {
            let resolvedTarget = target - item
            for subIdx in stride(from: idx + 1, to: nums.count, by: 1) {
                let potentialTarget = nums[subIdx]
                if potentialTarget == resolvedTarget {
                    res.append(idx)
                    res.append(subIdx)
                    return res
                }
            }
        }
        return res
    }
}


func solution(nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    var temp: [Int] = []
    backtrack(nums: nums, res: &res, temp: &temp, start: 0)
    return res
}

func backtrack(nums: [Int], res: inout [[Int]], temp: inout [Int], start: Int) {
    if start == 0 { // some condtion to calculate res
        res.append(temp)
    } else {
        for idx in start..<nums.count {
            if idx > start && nums[idx] == nums[idx - 1] {
                continue // to avoid dupicates
            }
            temp.append(nums[idx])
            backtrack(nums: nums, res: &res, temp: &temp, start: idx + 1)
            temp.removeLast()
        }
    }
}
