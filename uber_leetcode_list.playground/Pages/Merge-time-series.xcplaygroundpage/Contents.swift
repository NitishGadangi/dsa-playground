import Foundation

//https://leetcode.com/discuss/post/1992821/uber-onsite-coding-question-2022-by-cons-arim/

class Solution {
    func mergeTimeSeries(_ list1: [[Int]], _ list2: [[Int]]) -> [[Int]] {
        let list1 = Array(list1.reversed())
        let list2 = Array(list2.reversed())
        var res: [[Int]] = []
        let m = list1.count
        let n = list2.count
        var i = 0
        var j = 0
        var val1 = 0
        var val2 = 0
        // similar to merge sorted list - but in decending order
        while i < m && j < n {
            let t1 = list1[i][0]
            let t2 = list2[j][0]
            if t1 > t2 {
                val1 = list1[i][1]
                res.append([t1, val1 + val2])
                i += 1
            } else if t2 > t1 {
                val2 = list2[j][1]
                res.append([t2, val1 + val2])
                j += 1
            } else { // equal
                val1 = list1[i][1]
                val2 = list2[j][1]
                res.append([t1, val1 + val2])
                i += 1
                j += 1
            }
        }

        while i < m {
            val1 = list1[i][1]
            res.append([list1[i][0], val1 + val2])
            i += 1
        }
        while j < n {
            val2 = list2[j][1]
            res.append([list2[j][0], val1 + val2])
            j += 1
        }
        return res.reversed()
    }
}
