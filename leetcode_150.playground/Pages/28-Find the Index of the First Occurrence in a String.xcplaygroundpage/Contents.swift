import Foundation

//https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    //sliding window
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hayArr = Array(haystack)
        var window = [String]()
        let winLen = needle.count

        // setup window
        for idx in stride(from: 0, to: winLen, by: 1) {
            let hayItem = hayArr[idx]
            window.append("\(hayItem)")
        }

        // slide
        var idx = winLen - 1
        while idx <= hayArr.count {
            let res = idx - (winLen - 1)
            let windowVal = window.joined(separator: "")
            if windowVal == needle {
                return res
            } else if idx >= hayArr.count {
                break
            }
            idx += 1
            window.remove(at: 0)
            let nextHayItem = hayArr[idx]
            window.append("\(nextHayItem)")
        }

        return -1
    }
}

let test = Solution()
test.strStr("a", "a")

// Brute force
//class AlternateSolution {
//    func strStr(_ haystack: String, _ needle: String) -> Int {
//        let hayArr = Array(haystack)
//        let needleArr = Array(needle)
//
//        var idx = 0
//        while idx < hayArr.count {
//            let res = idx
//            var subIdx = 0
//            while subIdx < needleArr.count {
//            }
//            if subIdx = needleArr.count {
//                return res
//            }
//        }
//
//        return -1
//    }
//}
