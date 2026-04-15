import Foundation

// https://algo.monster/liteproblems/1429

class Node {
    var next: Node?
    var prev: Node?
    let val: Int
    init(val: Int) {
        self.val = val
    }
}
class FirstUnique {
    let head: Node
    let tail: Node
    var map: [Int: Node] //val-node
    var dupes: Set<Int>

    init(_ nums: [Int]) {
        head = Node(val: -1)
        tail = Node(val: -1)
        map = [:]
        dupes = []
        head.next = tail
        tail.prev = head
        for num in nums {
            add(num)
        }
    }

    func showFirstUnique() -> Int {
        guard let headNode = head.next else { return -1 }
        if headNode === tail { return -1 }
        return headNode.val
    }

    func add(_ value: Int) {
        if dupes.contains(value) { return }
        if let node = map[value] {
            delete(node)
            map.removeValue(forKey: value)
            dupes.insert(value)
            return
        }
        let node = Node(val: value)
        insertAtTail(node)
        map[value] = node
    }

    func delete(_ node: Node) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
    }

    func insertAtTail(_ node: Node) {
        let prev = head.prev
        prev?.next = node
        node.prev = prev
        node.next = tail
        tail.prev = node
    }
}

class FirstUniqueSlow {
    var count: [Int: Int] = [:]
    var queue: [Int] = []

    init(_ nums: [Int]) {
        for num in nums {
            add(num)
        }
    }

    func showFirstUnique() -> Int {
        while !queue.isEmpty && count[queue[0]]! > 1 {
            queue.removeFirst()
        }
        return queue.first ?? -1
    }

    func add(_ value: Int) {
        count[value, default: 0] += 1
        if count[value] == 1 {
            queue.append(value)
        }
    }
}
