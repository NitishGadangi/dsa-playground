import Foundation

//https://leetcode.com/problems/merge-sorted-array/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard n > 0 else {
            return
        }
        guard m > 0 else {
            nums1 = nums2
            return
        }
        nums1.removeLast(n)
        var idx1 = 0
        var idx2 = 0
        while (idx1 < nums1.count) && (idx2 < n) {
            let curNum1 = nums1[idx1]
            let curNum2 = nums2[idx2]
            if (curNum2 < curNum1) {
                nums1.insert(curNum2, at: idx1)
                idx2 += 1
            }
            idx1 += 1
        }
        while idx2 < n {
            let curNum2 = nums2[idx2]
            nums1.insert(curNum2, at: idx1)
            idx1 += 1
            idx2 += 1
        }
    }
}

class AlternateSolution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    guard n > 0 else {
        return
    }
    guard m > 0 else {
        nums1 = nums2
        return
    }

    var currentNum1Index = m - 1

    // first check to see if we can just transfer nums2 into the end of nums1
    if nums2[0] >= nums1[currentNum1Index] {

        for i in 0..<nums2.count {
            nums1[m + i] = nums2[i]
        }
        return
    }

    let lastIndex = nums1.count - 1
    var currentNum2Index = n - 1

    // fill in nums1 backwards, comparing the last value in each array
    for i in stride(from: lastIndex, to: -1, by: -1) {

        if currentNum1Index < 0 || (nums2[currentNum2Index] > nums1[currentNum1Index]) {
            nums1[i] = nums2[currentNum2Index]
            currentNum2Index -= 1
            if currentNum2Index < 0 {
                return
            }
        }
        else {
            nums1[i] = nums1[currentNum1Index]
            currentNum1Index -= 1
        }
    }
}
}
