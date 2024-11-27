import Foundation

//https://leetcode.com/problems/fruit-into-baskets/

class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var map: [Int: Int] = [:]
        var start = 0
        var end = 0
        var res: Int = 0
        while end < fruits.count {
            let endFruit = fruits[end]
            map[endFruit] = (map[endFruit] ?? 0) + 1

            while start <= end && map.count > 2 {
                let startFruit = fruits[start]
                let fruitCnt = map[startFruit] ?? 0
                if fruitCnt > 1 {
                    map[startFruit] = fruitCnt - 1
                } else {
                    map.removeValue(forKey: startFruit)
                }
                start += 1
            }
            let tempRes = end - start + 1
            res = max(res, tempRes)
            end += 1
        }
        return res
    }
}
