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
