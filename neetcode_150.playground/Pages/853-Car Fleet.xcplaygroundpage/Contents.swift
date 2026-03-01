import Foundation

//https://leetcode.com/problems/car-fleet/description/

class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var stack: [Double] = []
        var cars = zip(position, speed).sorted { $0.0 > $1.0 }

        for (p, s) in cars {
            let time = Double(target - p)/Double(s)
            if let topTime = stack.last, time <= topTime { continue }
            stack.append(time)
        }

        return stack.count
    }
}
