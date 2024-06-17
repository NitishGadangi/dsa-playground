import Foundation

//https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var start = 0
        var end = numbers.count - 1

        while (start < end) {
            let left = numbers[start]
            let right = numbers[end]
            let curSum = left + right
            if curSum == target {
                break
            } else if curSum < target {
                start += 1
            } else {
                end -= 1
            }
        }
        return [start + 1, end + 1]
    }
}
