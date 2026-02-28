import Foundation

//https://leetcode.com/problems/valid-parentheses/description/

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var res: [Int] = []
        var dequeue: [Int] = []
        var start: Int = 0
        var end: Int = 0
        while end < nums.count {
            let cur = nums[end]
            while let last = dequeue.last, nums[last] < cur {
                dequeue.removeLast()
            }
            dequeue.append(end)
            if let first = dequeue.first, first < start {
                dequeue.removeFirst()
            }

            if end >= k-1, let curMaxIdx = dequeue.first {
                res.append(nums[curMaxIdx])
                start += 1
            }

            end += 1
        }
        return res
    }
}

let res = Solution().maxSlidingWindow([1], 1)
