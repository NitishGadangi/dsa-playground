import Foundation

//https://leetcode.com/problems/subsets-ii/

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var temp: [Int] = []
        var nums = nums.sorted()
        backtrack(nums: nums, res: &res, temp: &temp, start: 0)
        return res
    }
    
    func backtrack(nums: [Int], res: inout [[Int]], temp: inout [Int], start: Int) {
        res.append(temp)
        for idx in start..<nums.count {
            let curNum = nums[idx]
            //skipping duplicates
            // this will avoid removing and adding the same num to temp arr
            if idx > start && curNum == nums[idx - 1] { continue }
            temp.append(curNum)
            backtrack(nums: nums, res: &res, temp: &temp, start: idx + 1)
            temp.removeLast()
        }
    }
}

let res = Solution().subsetsWithDup([1,2,2])
print(res)
