import Foundation

// https://algo.monster/liteproblems/253

class Interval {
    var start: Int
    var end: Int
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

//If a meeting starts before the earliest ending meeting finishes, we need a new room
//Otherwise a meeting ended → free a room

class Solution {
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        var starts: [Int] = intervals.map { $0.start }.sorted()
        var ends: [Int] = intervals.map { $0.end }.sorted()
        var rooms = 0
        var endIdx = 0
        for st in starts {
            if st < ends[endIdx] {
                rooms += 1
            } else {
                endIdx += 1
            }
        }
        return rooms
    }
}
