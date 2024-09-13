import Foundation

//https://leetcode.com/problems/next-permutation/

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        // find arr[i] > arr[i-1] from tight
        var idx = nums.count - 1
        while idx > 0 && nums[idx] <= nums[idx - 1] {
            idx -= 1
        }
        if idx == 0 {
            reverse(nums: &nums, from: 0, to: nums.count - 1)
            return
        }

        // swap arr[i-1] with next closest big number
        var swpIdx = nums.count - 1
        while (swpIdx > idx - 1) && (nums[swpIdx] <= nums[idx - 1]) {
            swpIdx -= 1
        }
        swap(nums: &nums, from: idx - 1, to: swpIdx)

        // reverse the array from i..n
        reverse(nums: &nums, from: idx, to: nums.count - 1)
    }

    func swap(nums: inout [Int], from: Int, to: Int) {
        (nums[from], nums[to]) = (nums[to], nums[from])
    }

    func reverse(nums: inout [Int], from: Int, to: Int) {
        var from = from
        var to = to
        while from < to {
            (nums[from], nums[to]) = (nums[to], nums[from])
            from += 1
            to -= 1
        }
    }
}
