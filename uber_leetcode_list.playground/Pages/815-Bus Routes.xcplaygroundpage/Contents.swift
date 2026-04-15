import Foundation

// https://leetcode.com/problems/bus-routes/

class Solution {
    func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        var stopsForBus = routes // busnum - [stops]
        var busAtStop = [Int: [Int]]() // stop - [bus no.]
        for (busNo, busStops) in routes.enumerated() {
            for stop in busStops {
                busAtStop[stop, default: []].append(busNo)
            }
        }

        var seenBus = Set<Int>()
        var seenStops = Set<Int>([source])
        var queue: [Int] = [source]
        var res = 0

        while !queue.isEmpty {
            let curLevel = queue.count
            for _ in 0..<curLevel {
                let curStop = queue.removeFirst()
                if curStop == target { return res }
                for bus in busAtStop[curStop, default: []] {
                    if seenBus.contains(bus) { continue }
                    seenBus.insert(bus)
                    for stop in stopsForBus[bus] {
                        if seenStops.contains(stop) { continue }
                        seenStops.insert(stop)
                        queue.append(stop)
                    }
                }
            }
            res += 1
        }
        return -1
    }
}
