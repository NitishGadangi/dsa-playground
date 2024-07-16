import Foundation

//https://leetcode.com/problems/implement-trie-prefix-tree/description/?envType=study-plan-v2&envId=top-interview-150


class Trie {

    private final class Node {
        var isTerminal: Bool = false
        var next: [Character: Node] = [:]
    }

    private let root: Node

    init() {
        root = Node()
    }

    func insert(_ word: String) {
        var curNode = root
        for ch in word {
            if let nextNode = curNode.next[ch] {
                curNode = nextNode
            } else {
                let nextNode = Node()
                curNode.next[ch] = nextNode
                curNode = nextNode
            }
        }
        curNode.isTerminal = true
    }

    func search(_ word: String) -> Bool {
        var curNode = root
        for ch in word {
            if let nextNode = curNode.next[ch] {
                curNode = nextNode
            } else {
                return false
            }
        }
        return curNode.isTerminal
    }

    func startsWith(_ prefix: String) -> Bool {
        var curNode = root
        for ch in prefix {
            if let nextNode = curNode.next[ch] {
                curNode = nextNode
            } else {
                return false
            }
        }
        return true
    }
}
