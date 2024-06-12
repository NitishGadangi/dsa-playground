import Foundation

//https://leetcode.com/problems/rotate-array/description/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let kFloor = k % nums.count
        var end = nums.count - 1
        reverse(&nums, from: 0, to: end)
        reverse(&nums, from: 0, to: kFloor - 1)
        reverse(&nums, from: kFloor, to: end)
    }

    func reverse(_ nums: inout [Int], from: Int, to: Int) {
        var start = from
        var end = to
        while start <= end {
            let startItem = nums[start]
            nums[start] = nums[end]
            nums[end] = startItem
            start += 1
            end -= 1
        }
    }
}
