import Foundation

//https://leetcode.com/problems/meeting-rooms-ii/

// Without Heap Solution
class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var starts: [Int] = []
        var ends: [Int] = []
        for inter in intervals {
            starts.append(inter[0])
            ends.append(inter[1])
        }
        starts = starts.sorted()
        ends = ends.sorted()
        var sptr = 0
        var eptr = 0
        var num = 0
        while sptr < intervals.count {
            if starts[sptr] >= ends[eptr] {
                num -= 1
                eptr += 1
            }
            
            sptr += 1
            num += 1
        }
        return num
    }
}
