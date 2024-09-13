import Foundation

//https://leetcode.com/problems/meeting-rooms-ii

class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 0 else { return 0 }
        var intervals = intervals.sorted { first, second in
            first[0] < second[0]
        }
        var minHeap: [Int] = []
        minHeap.addToHeap(intervals.first![1])

        for idx in 1..<intervals.count {
            let interval = intervals[idx]
            guard let start = interval.first,
                  let end = interval.last else { continue }

            print(minHeap)

            if let heapFirst = minHeap.first, start >= heapFirst {
                minHeap.removeFirst()
            }

            minHeap.addToHeap(end)
        }

        return minHeap.count
    }
}

extension Array where Element == Int {
    mutating func addToHeap(_ item: Int) {
        append(item)
        self = sorted()
    }
}

let test = Solution().minMeetingRooms([[0,30],[5,10],[15,20]])
