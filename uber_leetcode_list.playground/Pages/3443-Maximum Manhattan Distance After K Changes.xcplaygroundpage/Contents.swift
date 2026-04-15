import Foundation

// https://leetcode.com/problems/maximum-manhattan-distance-after-k-changes/description/

class Solution {
    func maxDistance(_ s: String, _ k: Int) -> Int {
        let sArr: [Character] = Array(s)
        let ne = distance(sArr, k, firstDir: "N", secondDir: "E")
        let se = distance(sArr, k, firstDir: "S", secondDir: "E")
        let sw = distance(sArr, k, firstDir: "S", secondDir: "W")
        let nw = distance(sArr, k, firstDir: "N", secondDir: "W")
        return max(max(ne, se), max(sw, nw))
    }

    func distance(_ sArr: [Character], _ k: Int, firstDir: Character, secondDir: Character) -> Int {
        var dist = 0
        var limit = k
        var maxDist = 0
        for ch in sArr {
            if ch == firstDir || ch == secondDir {
                dist += 1
            } else if limit > 0 {
                dist += 1
                limit -= 1
            } else {
                dist -= 1
            }
            maxDist = max(maxDist, dist)
        }
        return maxDist
    }
}
