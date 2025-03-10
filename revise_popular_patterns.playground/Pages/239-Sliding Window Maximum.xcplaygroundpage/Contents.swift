import Foundation

//https://leetcode.com/problems/sliding-window-maximum/

class Solution {
    // maintain a queue where first item is always the max value at a given time
    // insert from back removing all items less than given item
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var queue: [Int] = []
        var res: [Int] = []
        for idx in 0..<nums.count {
            let curNum = nums[idx]
            while !queue.isEmpty && queue.last! < curNum {
                queue.removeLast()
            }
            queue.append(curNum)
            if idx >= k && nums[idx - k] == queue.first! {
                queue.removeFirst()
            }
            if idx >= k - 1 {
                res.append(queue.first!)
            }
        }
        return res
    }
}
