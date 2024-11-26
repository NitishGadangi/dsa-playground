import Foundation

//https://leetcode.com/problems/find-k-closest-elements/

class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var start = 0
        var end = arr.count - 1
        var tarIdx = start
        while start <= end {
            let mid = start + (end - start)/2
            let midVal = arr[mid]
            tarIdx = mid
            if x < midVal {
                end = mid - 1
            } else if x > midVal {
                start = mid + 1
            } else {
                break
            }
        }
        var l = (tarIdx - k) >= 0 ? tarIdx - k : 0
        var r = (tarIdx + k) < arr.count ? tarIdx + k : arr.count - 1
        while (r - l + 1) > k {
            let dl = x - arr[l]
            let dr = arr[r] - x
            if dl <= dr {
                r -= 1
            } else {
                l += 1
            }
        }
        
        var res: [Int] = []
        for idx in l...r {
            res.append(arr[idx])
        }
        return res
    }
}
