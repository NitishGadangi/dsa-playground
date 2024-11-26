import Foundation

//https://leetcode.com/problems/peak-index-in-a-mountain-array/

class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var start = 0
        var end = arr.count - 1
        while start < end {
            let mid = start + (end - start)/2
            let midVal = arr[mid]
            let leftVal = mid - 1 >= start ? arr[mid - 1] : midVal
            let rightVal = mid + 1 <= end ? arr[mid + 1] : midVal
            if leftVal < midVal && rightVal < midVal {
                return mid
            }
            
            // increasing slope of mountain
            if leftVal < rightVal {
                start = mid + 1
            } else { // decreasing slope of mountain
                end = mid - 1
            }
        }
        return start
    }
}
