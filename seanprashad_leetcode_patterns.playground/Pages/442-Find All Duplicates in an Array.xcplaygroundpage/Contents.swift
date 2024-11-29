import Foundation

//https://leetcode.com/problems/find-all-duplicates-in-an-array/

class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var res: [Int] = []
        for num in nums {
            let actNum = abs(num)
            nums[actNum - 1] *= -1
            if nums[actNum - 1] > 0 {
                res.append(actNum)
            }
        }
        return res
    }
}
