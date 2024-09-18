import Foundation

//https://leetcode.com/problems/maximum-distance-in-arrays

class Solution {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        let n = arrays.count
        guard n > 0 else { return 0 }
        var minSoFar = Int.max
        var maxSoFar = Int.min
        var dist = 0

        for (idx, subArr) in arrays.enumerated() {
            let curMin = subArr.first
            var curMax = subArr.last
            guard let curMin else { continue }
            if curMax == nil {
                curMax = curMin
            }

            if idx == 0 {
                minSoFar = curMin
                maxSoFar = curMax!
                continue
            }

            dist = max(dist, abs(maxSoFar - curMin))
            dist = max(dist, abs(curMax! - minSoFar))

            maxSoFar = max(maxSoFar, curMax!)
            minSoFar = min(minSoFar, curMin)
        }

        return dist
    }
}

