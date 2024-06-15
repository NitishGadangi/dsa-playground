import Foundation

//https://leetcode.com/problems/h-index/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        guard (citations.count > 0) else { return 0 }
        let sortedCitations = citations.sorted { ele1, ele2 in
            ele1 > ele2
        }
        print(sortedCitations)
        //Binary Sort
        var start = 0
        var end = citations.count - 1
        var curCitations = 0
        while start <= end {
            let mid = start + ((end - start)/2)
            if isValidHIndex(h: mid, citations: sortedCitations) {
                curCitations = mid + 1
                start = mid + 1
            } else {
                end = mid - 1
            }
            print(curCitations)
        }
        return curCitations
    }

    func isValidHIndex(h: Int, citations: [Int]) -> Bool {
        let curIdxVal = citations[h]
        if curIdxVal >= (h + 1) {
            return true
        }
        return false
    }
}
