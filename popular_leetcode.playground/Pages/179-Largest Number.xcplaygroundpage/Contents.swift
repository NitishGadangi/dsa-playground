import Foundation

//https://leetcode.com/problems/largest-number

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var strNums = nums.map { "\($0)" }
        var sortedNums = strNums.sorted { first, second in
            return first + second > second + first
        }
        if let firstItem = sortedNums.first, firstItem == "0" {
            return "0"
        }
        return sortedNums.joined(separator: "")
    }
}
