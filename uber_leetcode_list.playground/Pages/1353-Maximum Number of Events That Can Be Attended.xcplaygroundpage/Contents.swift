import Foundation

// https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended/

// Greedily try to finish the event that ends first
class Solution {
    func maxEvents(_ events: [[Int]]) -> Int {
        var events = events.sorted { l, r in
            if l[1] == r[1] { return l[0] < r[0] }
            return l[1] < r[1]
        }
        var days: Set<Int> = []
        for ev in events {
            let start = ev[0]
            let end = ev[1]
            var d = start
            while days.contains(d) && d <= end {
                d += 1
            }
            if d <= end {
                days.insert(d)
            }
        }
        return days.count
    }
}
