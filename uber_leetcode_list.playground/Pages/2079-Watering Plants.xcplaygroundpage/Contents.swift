import Foundation

// https://leetcode.com/problems/watering-plants/

// traverse over the array. If bucket empty add 2*idx to count
class Solution {
    func wateringPlants(_ plants: [Int], _ capacity: Int) -> Int {
        var steps = 0
        var water = capacity
        for (idx, req) in plants.enumerated() {
            steps += 1
            if req <= water {
                water -= req
            } else {
                steps += 2 * idx
                water = capacity - req
            }
        }
        return steps
    }
}
