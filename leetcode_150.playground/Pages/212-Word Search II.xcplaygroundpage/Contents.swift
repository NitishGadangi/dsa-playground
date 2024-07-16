import Foundation

//https://leetcode.com/problems/word-search-ii/description/?envType=study-plan-v2&envId=top-interview-150

class Trie {
    public final class Node {
        public var isTerminal: Bool = false
        public var next: [Character: Node] = [:]
    }

    let root: Node

    init() {
        self.root = Node()
    }

    public func insert(word: String) {
        var curNode = root
        for char in word {
            if let nextNode = curNode.next[char] {
                curNode = nextNode
            } else {
                let nextNode = Node()
                curNode.next[char] = nextNode
                curNode = nextNode
            }
        }
        curNode.isTerminal = true
    }
}

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let trie = Trie()
        for word in words {
            trie.insert(word: word)
        }
        let rows = board.count
        let columns = board[0].count
        var res = Set<String>()
        var visit = Set<[Int]>()

        func dfs(r: Int, c: Int, node: Trie.Node, word: String) {
            guard !visit.contains([r, c]),
                  r >= 0,
                  r < rows,
                  c >= 0,
                  c < columns 
            else { return }
            let curChar = board[r][c]
            guard let nextNode = node.next[curChar] else { return }

            let newWord = word + String(curChar)
            if nextNode.isTerminal {
                res.insert(newWord)
            }
            visit.insert([r, c])
            dfs(r: r + 1, c: c, node: nextNode, word: newWord)
            dfs(r: r - 1, c: c, node: nextNode, word: newWord)
            dfs(r: r, c: c + 1, node: nextNode, word: newWord)
            dfs(r: r, c: c - 1, node: nextNode, word: newWord)
            visit.remove([r, c])
        }

        for r in 0..<rows {
            for c in 0..<columns {
                dfs(r: r, c: c, node: trie.root, word: "")
            }
        }

        return Array(res)
    }
}
