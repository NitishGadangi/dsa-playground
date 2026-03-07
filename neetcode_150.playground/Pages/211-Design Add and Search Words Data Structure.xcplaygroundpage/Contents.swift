import Foundation

//https://leetcode.com/problems/design-add-and-search-words-data-structure/description/

class WordDictionary {
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

    func addWord(_ word: String) {
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
        return search(word, root: root, start: 0)
    }

    private func search(_ word: String, root: Node, start: Int) -> Bool {
        var cur = root
        let chArr = Array(word).map { String($0) }.map { Character($0) }
        for idx in start..<word.count {
            let ch = chArr[idx]
            if ch == "." {
                for (_, nextNode) in cur.next {
                    if search(word, root: nextNode, start: idx + 1) {
                        return true
                    }
                }
                return false
            } else {
                if let nextNode = cur.next[ch] {
                    cur = nextNode
                } else {
                    return false
                }
            }
        }
        return cur.isTerminal
    }
}
