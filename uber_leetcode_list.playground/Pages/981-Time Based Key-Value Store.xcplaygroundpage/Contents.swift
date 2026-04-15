import Foundation

// https://leetcode.com/problems/time-based-key-value-store/description/

class TimeMap {
    struct TimedValue {
        let value: String
        let time: Int
    }
    var map: [String: [TimedValue]]

    init() {
        map = [:]
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        map[key, default: []].append(TimedValue(value: value, time: timestamp))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let vals = map[key] else { return "" }
        let upperBound = binarySearch(timestamp + 1, in: vals.map{ $0.time })
        if upperBound == 0 { return "" }
        return vals[upperBound - 1].value
    }

    // upper bound: idx of val >= target
    private func binarySearch(_ target: Int, in arr: [Int]) -> Int {
        var start = 0
        var end = arr.count
        while start < end {
            let mid = start + (end - start)/2
            if arr[mid] < target {
                start = mid + 1
            } else {
                end = mid
            }
        }
        return start
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */
