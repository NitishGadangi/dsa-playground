import Foundation

//https://leetcode.com/problems/time-based-key-value-store/description/

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
        var values = map[key, default: []]
        values.append(TimedValue(value: value, time: timestamp))
        map[key] = values.sorted{ $0.time < $1.time }
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        let values = map[key, default: []]
        var res: String = ""
        guard !values.isEmpty else { return res }
        var start = 0
        var end = values.count - 1
        while start <= end {
            let mid = start + (end - start)/2
            let midVal = values[mid]
            if midVal.time == timestamp {
                return midVal.value
            }
            if midVal.time < timestamp {
                res = midVal.value
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        return res
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */
