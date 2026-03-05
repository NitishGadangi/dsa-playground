import Foundation

//https://neetcode.io/problems/meeting-schedule-ii/question?list=neetcode150

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
        let starts = intervals.map { $0.start }.sorted()
        let ends = intervals.map { $0.end }.sorted()
        var rooms: Int = 0
        var endIdx: Int = 0
        for start in starts {
            if start < ends[endIdx] {
                rooms += 1
            } else {
                endIdx += 1
            }
        }
        return rooms
    }
}

