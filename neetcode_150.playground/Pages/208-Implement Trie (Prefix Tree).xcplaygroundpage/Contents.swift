import Foundation

//https://leetcode.com/problems/implement-trie-prefix-tree/

class Trie {
    class Node {
        var isTerminal: Bool
        var next: [Character: Node]
        init(isTerminal: Bool = false) {
            self.isTerminal = isTerminal
            self.next = [:]
        }
    }

    let root: Node

    init() {
        root = Node()
    }

    func insert(_ word: String) {
        var cur = root
        for ch in word {
            if let nextNode = cur.next[ch] {
                cur = nextNode
            } else {
                let nextNode = Node()
                cur.next[ch] = nextNode
                cur = nextNode
            }
        }
        cur.isTerminal = true
    }

    func search(_ word: String) -> Bool {
        var cur = root
        for ch in word {
            if let nexNode = cur.next[ch] {
                cur = nexNode
            } else {
                return false
            }
        }
        return cur.isTerminal
    }

    func startsWith(_ prefix: String) -> Bool {
        var cur = root
        for ch in prefix {
            if let nextNode = cur.next[ch] {
                cur = nextNode
            } else {
                return false
            }
        }
        return true
    }
}
