import Foundation

//http://neetcode.io/problems/meeting-schedule/question?list=neetcode150

class Interval {
    var start: Int
    var end: Int
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}


class Solution {
    func canAttendMeetings(_ intervals: [Interval]) -> Bool {
        let intervals = intervals.sorted{ $0.start < $1.start }
        for idx in 0..<intervals.count {
            if idx == 0 { continue }
            if intervals[idx - 1].end > intervals[idx].start {
                return false
            }
        }
        return true
    }
}

