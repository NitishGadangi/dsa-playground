import Foundation

//https://leetcode.com/problems/meeting-rooms/

class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        var intervals = intervals.sorted { first, second in
            return first[0] < second[0]
        }
        for (idx, meet) in intervals.enumerated() where (idx + 1) < intervals.count {
            let curEnd = meet[1]
            let nextStart = intervals[idx + 1][0]
            if curEnd > nextStart {
                return false
            }
        }
        return true
    }
}
