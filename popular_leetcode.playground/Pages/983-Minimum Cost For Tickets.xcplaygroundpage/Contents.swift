import Foundation

//https://leetcode.com/problems/minimum-cost-for-tickets

class Solution {
    var memoMap: [Int: Int] = [:]
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        guard let lastDay = days.last else { return 0 }
        return calCost(curDay: 1, lastDay: lastDay, travelDays: Set<Int>(days), costs: costs)
    }

    func calCost(curDay: Int, lastDay: Int, travelDays: Set<Int>, costs: [Int]) -> Int {
        guard curDay <= lastDay else { return 0 }

        if let res = memoMap[curDay] {
            return res
        }

        if !travelDays.contains(curDay) {
            let res = calCost(curDay: curDay + 1, lastDay: lastDay, travelDays: travelDays, costs: costs)
            memoMap[curDay] = res
            return res
        }

        let oneDay = costs[0] + calCost(curDay: curDay + 1, lastDay: lastDay, travelDays: travelDays, costs: costs)
        let oneWeek = costs[1] + calCost(curDay: curDay + 7, lastDay: lastDay, travelDays: travelDays, costs: costs)
        let oneMonth = costs[2] + calCost(curDay: curDay + 30, lastDay: lastDay, travelDays: travelDays, costs: costs)
        let res = min(oneDay, min(oneWeek, oneMonth))
        memoMap[curDay] = res
        return res
    }
}
