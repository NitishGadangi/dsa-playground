import Foundation

//https://leetcode.com/problems/find-peak-element/

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var start: Int = 0
        var end: Int = nums.count - 1
        while start <= end {
            let mid = start + (end - start)/2
            let leftVal = nums[safe: mid - 1, Int.min]
            let rightVal = nums[safe: mid + 1, Int.min]
            let midVal = nums[mid]
            if leftVal < midVal && midVal > rightVal {
                return mid
            }
            if leftVal < rightVal {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        return -1
    }
}

extension Array {
    subscript(safe index: Int, fallback: Element) -> Element {
        guard index >= 0 && index < count else { return fallback }
        return self[index]
    }
}
