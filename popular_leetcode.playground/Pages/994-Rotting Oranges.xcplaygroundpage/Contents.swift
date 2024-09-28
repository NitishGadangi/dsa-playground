import Foundation

//https://leetcode.com/problems/rotting-oranges

class Solution {
    struct Orange {
        let row: Int
        let col: Int
    }
    
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count
        guard rows > 0 else { return -1 }
        let cols = grid[0].count
        var fresh = 0
        var queue: [Orange] = []
        for r in 0..<rows {
            for c in 0..<cols {
                let curCell = grid[r][c]
                if curCell == 1 {
                    fresh += 1
                } else if curCell == 2 {
                    queue.append(Orange(row: r, col: c))
                }
            }
        }
        var time = 0
        var directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
        while !queue.isEmpty && fresh > 0 {
            time += 1
            let count = queue.count
            for _ in 0..<count {
                let curItem = queue.removeFirst()
                for dir in directions {
                    let dx = curItem.row + dir[0]
                    let dy = curItem.col + dir[1]
                    if dx >= 0 && dx < rows && dy >= 0 && dy < cols
                        && grid[dx][dy] == 1 {
                        fresh -= 1
                        grid[dx][dy] = 2
                        queue.append(Orange(row: dx, col: dy))
                    }
                }
            }
        }
        
        return fresh > 0 ? -1 : time
    }
}
