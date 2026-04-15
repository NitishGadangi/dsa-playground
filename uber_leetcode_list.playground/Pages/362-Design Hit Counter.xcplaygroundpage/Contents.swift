import Foundation

//https://algo.monster/liteproblems/362

class HitCounter {
    var timeList: [Int]

    init() {
        timeList = []
    }

    func hit(timestamp: Int) {
        timeList.append(timestamp)
    }

    func getHits(timestamp: Int) -> Int {
        let startTime = timestamp - 299
        let startIdx = binarySearch(target: startTime)
        let endIdx = binarySearch(target: timestamp + 1)
        return endIdx - startIdx
    }

    // index of item >= target
    func binarySearch(target: Int) -> Int {
        var left = 0
        var right = timeList.count // IMP: we need to use open interval to avoid infinite loops.
        while left <= right {
            let mid = left + (right - left)/2
            if timeList[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
