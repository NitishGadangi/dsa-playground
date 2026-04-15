import Foundation

// https://leetcode.com/problems/lru-cache/

class Node {
    var prev: Node?
    var next: Node?
    let key: Int
    var val: Int
    init(key: Int, val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    let cap: Int
    let head: Node
    let tail: Node
    var map: [Int: Node] // key - node
    var count: Int

    init(_ capacity: Int) {
        cap = capacity
        head = Node(key: -1, val: -1)
        tail = Node(key: -1, val: -1)
        map = [:]
        count = 0
        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        guard let node = map[key] else { return  -1 }
        moveToHead(node)
        return node.val
    }

    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node.val = value
            moveToHead(node)
            return
        }
        let node = Node(key: key, val: value)
        addToHead(node)
        map[key] = node
        count += 1
        if count > cap {
            if let tailNode = tail.prev, tailNode !== head {
                delete(tailNode)
                map.removeValue(forKey: tailNode.key)
                count -= 1
            }
        }
    }

    func delete(_ node: Node) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
    }

    func addToHead(_ node: Node) {
        let next = head.next
        head.next = node
        node.prev = head
        node.next = next
        next?.prev = node
    }

    func moveToHead(_ node: Node) {
        delete(node)
        addToHead(node)
    }
}

