import Foundation

//https://leetcode.com/problems/keys-and-rooms

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var cnt = rooms.count
        var visited = Array(repeating: false, count: cnt)
        var queue: [Int] = [0]
        
        while !queue.isEmpty {
            let curRoom = queue.removeFirst()
            visited[curRoom] = true
            for nextRoom in rooms[curRoom] {
                if !visited[nextRoom] {
                    queue.append(nextRoom)
                }
            }
        }
        
        for vis in visited {
            if !vis { return false }
        }
        return true
    }
}
