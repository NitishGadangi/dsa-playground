import Foundation

//https://leetcode.com/problems/sort-colors/

// DutchNationalFlag Algorithm
class Solution {
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        var low = 0
        var mid = 0
        var hi = nums.count - 1
        // at any point low, mid, hi points to unknown elements only
        // hence we dont do midx += 1 for case 2
        // but we do mid += 1 for case 0 as for item at idx low, we already filtered
        while mid <= hi {
            let cur = nums[mid]
            print("\(low) - \(mid) - \(hi) - \(nums)")
            switch cur {
            case 0:
                (nums[low], nums[mid]) = (nums[mid], nums[low])
                low += 1
                mid += 1
            case 1:
                mid += 1
            case 2:
                (nums[hi], nums[mid]) = (nums[mid], nums[hi])
                hi -= 1
            default:
                break
            }
        }
    }
}
