import Foundation

//https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var start = 0
        var end = numbers.count - 1
        while start < end {
            let curSum = numbers[start] + numbers[end]
            if curSum < target {
                start += 1
            } else if curSum > target {
                end -= 1
            } else {
                return [start + 1, end + 1]
            }
        }
        return []
    }
}
