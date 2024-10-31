import Foundation

//https://leetcode.com/problems/missing-number/

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        let expSum = (n * (n+1))/2
        let actSum = nums.reduce(0) { $0 + $1 }
        return expSum - actSum
    }
}
