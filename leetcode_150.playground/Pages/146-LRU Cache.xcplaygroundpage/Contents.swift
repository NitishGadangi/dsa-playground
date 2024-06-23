import Foundation

//https://leetcode.com/problems/lru-cache/?envType=study-plan-v2&envId=top-interview-150

class LRUCache {
    var head: Node?
    var tail: Node?
    let capacity: Int
    var keyMap: [Int: Node] = [:]
    var count: Int = 0 {
        didSet {
            cleanupIfNeeded()
        }
    }

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        if let node = keyMap[key] {
            moveToHead(node)
            print(keyMap)
            return node.value
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if let extNode = keyMap[key] {
            extNode.value = value
            moveToHead(extNode)
            return
        }
        let newNode = Node(key: key, value: value)
        keyMap[key] = newNode
        newNode.next = head
        head?.prev = newNode
        head = newNode
        if tail == nil {
            tail = newNode
        }
        count += 1
    }

    private func moveToHead(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        head?.prev = node
        node.next = head
        head = node
    }

    private func cleanupIfNeeded() {
        while count > capacity {
            keyMap.removeValue(forKey: tail?.key ?? -1)
            tail = tail?.prev
            tail?.next = nil
            count -= 1
        }
    }

    class Node: CustomStringConvertible {
        let key: Int
        var value: Int
        var prev: Node?
        var next: Node?
        init(key: Int, value: Int, prev: Node? = nil, next: Node? = nil) {
            self.key = key
            self.value = value
            self.prev = prev
            self.next = next
        }

        var description: String {
            return "key : \(key), value: \(value)"
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
