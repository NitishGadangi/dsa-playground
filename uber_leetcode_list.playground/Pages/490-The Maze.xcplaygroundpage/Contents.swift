import Foundation

//https://algo.monster/liteproblems/490

class Solution {
    var visited: [[Bool]] = []
    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
        if start == destination { return true }
        let rows = maze.count
        let cols = maze[0].count
        visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        return dfs(maze, dest: destination, r: start[0], c: start[1])
    }

    // modified dfs.
    // we will only move ahead once we are above to hit a wall
    func dfs(_ maze: [[Int]], dest: [Int], r: Int, c: Int) -> Bool {
        if r == dest[0] && c == dest[1] { return true }
        if visited[r][c] { return false }
        visited[r][c] = true

        let rows = maze.count
        let cols = maze[0].count
        let dr = [0, 1, -1, 0]
        let dc = [1, 0, 0, -1]
        for idx in 0..<dr.count {
            var rr = r
            var cc = c
            //keep rolling till we hit wall (1)
            while rr >= 0 && rr < rows && cc >= 0 && cc < cols && maze[rr][cc] == 0 {
                rr += dr[idx]
                cc += dc[idx]
            }
            // remove the last failure case
            rr -= dr[idx]
            cc -= dc[idx]
            if dfs(maze, dest: dest, r: rr, c: cc) {
                return true
            }
        }
        return false
    }
}
