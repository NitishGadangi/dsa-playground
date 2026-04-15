import Foundation

// https://leetcode.com/problems/my-calendar-i/


class MyCalendar {
    struct Event {
        let start: Int
        let end: Int
    }

    var booked: [Event]

    init() {
        booked = []
    }

    func book(_ startTime: Int, _ endTime: Int) -> Bool {
        let idx = binarSearch(startTime)
        if idx > 0 && booked[idx - 1].end > startTime {
            return false
        }
        if idx < booked.count && booked[idx].start < endTime {
            return false
        }
        booked.insert(Event(start: startTime, end: endTime), at: idx)
        return true
    }

    // lower bound search - As in, index of item just greater than or equal to >= target
    func binarSearch(_ target: Int) -> Int {
        var left = 0
        var right = booked.count
        while left < right {
            let mid = left + (right - left)/2
            let midEvent = booked[mid]
            if midEvent.start < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
