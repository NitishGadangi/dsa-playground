import Foundation

//https://leetcode.com/problems/range-sum-query-immutable/

class NumArray {
    var prefixArr: [Int] = []
    init(_ nums: [Int]) {
        var curSum = 0
        for num in nums {
            curSum += num
            prefixArr.append(curSum)
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        let leftSum = left - 1 >= 0 ? prefixArr[left - 1] : 0
        return prefixArr[right] - leftSum
    }
}
