import Foundation

//https://leetcode.com/problems/kth-largest-element-in-an-array/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let count = nums.count
        guard count >= k else { return -1 }
        var nums = nums
        quickSort(nums: &nums, start: 0, end: count - 1)
        return nums[count - k]
    }

    func quickSort(nums: inout [Int], start: Int, end: Int) {
        guard start < end else { return }
        let pivot = partition(nums: &nums, start: start, end: end)
        quickSort(nums: &nums, start: start, end: pivot - 1)
        quickSort(nums: &nums, start: pivot + 1, end: end)
    }

    func partition(nums: inout [Int], start: Int, end: Int) -> Int {
        guard start < end else { return start }
        print("\(start) \(end) \(nums)")
        let pivotVal = nums[end]

        var ptr = 0
        for idx in start..<end {
            let curVal = nums[idx]
            if curVal <= pivotVal {
                swapArr(nums: &nums, from: idx, to: ptr)
                ptr += 1
            }
        }
        swapArr(nums: &nums, from: end, to: ptr)
        print("pivot - \(ptr) \(nums)")
        return ptr
    }

    func swapArr(nums: inout [Int], from: Int, to: Int) {
        (nums[from], nums[to]) = (nums[to], nums[from])
    }
}

let ans = Solution().findKthLargest([3,2,3,1,2,4,5,5,6], 4)
print(ans)
