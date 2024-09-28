import Foundation

//https://leetcode.com/problems/campus-bikes

class Solution {
    struct WorkBikeDist: Comparable {
        static func < (lhs: Solution.WorkBikeDist, rhs: Solution.WorkBikeDist) -> Bool {
            if lhs.distance != rhs.distance {
                return lhs.distance < rhs.distance
            } else if lhs.worker != rhs.worker {
                return lhs.worker < rhs.worker
            } else {
                return lhs.bike < rhs.bike
            }
        }
        
        let worker: Int
        let bike: Int
        let distance: Int
    }
    
    
    func assignBikes(_ workers: [[Int]], _ bikes: [[Int]]) -> [Int] {
        var listWBD: [WorkBikeDist] = []
        for (idxW, work) in workers.enumerated() {
            for (idxB, bike) in bikes.enumerated() {
                let xW = work[0]
                let yW = work[1]
                let xB = bike[0]
                let yB = bike[1]
                let dist = abs(xW - xB) + abs(yW - yB)
                let itemWBD = WorkBikeDist(worker: idxW, bike: idxB, distance: dist)
                listWBD.append(itemWBD)
            }
        }
        let sortedList = listWBD.sorted()
        var bikesVisited: [Bool] = Array(repeating: false, count: bikes.count)
        var workerBikeIdxs: [Int] = Array(repeating: -1, count: workers.count)
        var workersRem = workers.count
        for item in sortedList {
            if workerBikeIdxs[item.worker] == -1 && bikesVisited[item.bike] == false {
                bikesVisited[item.bike] = true
                workerBikeIdxs[item.worker] = item.bike
                workersRem -= 1
            }
            if (workersRem == 0) { break }
        }
        return workerBikeIdxs
    }
}
