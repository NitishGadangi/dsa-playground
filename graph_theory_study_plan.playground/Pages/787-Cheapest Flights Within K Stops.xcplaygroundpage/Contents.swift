import Foundation

//https://leetcode.com/problems/cheapest-flights-within-k-stops/

class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var distances: [Int] = Array(repeating: Int.max, count: n)
        
        // Set src distance to 0
        distances[src] = 0
        
        // Relax nodes up to k + 1 times (k stops means k + 1 edges)
        for _ in 0...k {
            var tempDist = distances
            for ft in flights {
                let from = ft[0]
                let to = ft[1]
                let wt = ft[2]
                
                // Check to avoid overflow
                if distances[from] != Int.max {
                    let toDist = distances[from] + wt
                    if toDist < tempDist[to] {
                        tempDist[to] = toDist
                    }
                }
            }
            distances = tempDist
        }
        return distances[dst] == Int.max ? -1 : distances[dst]
    }
}

let res = Solution().findCheapestPrice(4, [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], 0, 3, 1)


class SolutionWithDijkstra {
    struct Node {
        let idx: Int
        let dist: Int
        var stops: Int = 0
    }
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var adjList: [[Node]] = Array(repeating: [], count: n)
        for ft in flights {
            adjList[ft[0]].append(Node(idx: ft[1], dist: ft[2]))
        }
        var dist: [Int] = Array(repeating: Int.max, count: n)
        var heap = Heap<Node> { l, r in
            l.dist < r.dist
        }
        heap.insert(item: Node(idx: src, dist: 0, stops: 0))
        while heap.isNotEmpty {
            let cur = heap.popTop()!
            if cur.idx == dst { return cur.dist }
            for nbr in adjList[cur.idx] {
                let newDist = cur.dist + nbr.dist
                if newDist < dist[nbr.idx] && cur.stops <= k {
                    dist[nbr.idx] = newDist
                    heap.insert(item: Node(idx: nbr.idx, dist: newDist, stops: cur.stops + 1))
                }
            }
        }
        return dist[dst] == Int.max ? -1 : dist[dst]
    }
}

struct Heap<T> {
    typealias HeapComparator = (_ l: T, _ r: T) -> Bool
    
    private(set) var heap = [T]()
    
    var count: Int {
        heap.count
    }
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var isNotEmpty: Bool {
        !heap.isEmpty
    }
    
    private let comparator: HeapComparator
    
    init(comparator: @escaping HeapComparator) {
        self.comparator = comparator
    }
    
    private func getParentIdx(child: Int) -> Int? {
        guard child >= 0 && child < count else {
            print("Heap: getParentIdx: Index Out of bounds")
            return nil
        }
        let idx = (child - 1)/2
        return idx >= 0 ? idx : nil
    }
    
    private func getLeftChildIdx(parent: Int) -> Int? {
        guard parent >= 0 && parent < count else {
            print("Heap: getLeftChildIdx: Index Out of bounds")
            return nil
        }
        let idx = 2 * parent + 1
        return idx < count ? idx : nil
    }
    
    private func getRightChildIdx(parent: Int) -> Int? {
        guard parent >= 0 && parent < count else {
            print("Heap: getRightChildIdx: Index Out of bounds")
            return nil
        }
        let idx = 2 * parent + 2
        return idx < count ? idx : nil
    }
    
    private mutating func swapHeapAt(idx1: Int, idx2: Int) {
        guard idx1 >= 0 && idx1 < count && idx2 >= 0 && idx2 < count else {
            print("Heap: SwapHeapAt: Index Out of bounds")
            return
        }
        let temp = heap[idx1]
        heap[idx1] = heap[idx2]
        heap[idx2] = temp
    }
    
    private mutating func bubbleUp(idx: Int) {
        guard let parent = getParentIdx(child: idx) else {
            return
        }
        if comparator(heap[idx], heap[parent]) {
            swapHeapAt(idx1: idx, idx2: parent)
            bubbleUp(idx: parent)
        }
    }
    
    private mutating func heapify(idx: Int) {
        var comp = idx
        if let left = getLeftChildIdx(parent: idx), comparator(heap[left], heap[comp]) {
            comp = left
        }
        if let right = getRightChildIdx(parent: idx), comparator(heap[right], heap[comp]) {
            comp = right
        }
        if comp != idx {
            swapHeapAt(idx1: comp, idx2: idx)
            heapify(idx: comp)
        }
    }
    
    public mutating func insert(item: T) {
        heap.append(item)
        bubbleUp(idx: count - 1)
    }
    
    public func getTop() -> T? {
        return heap.first
    }
    
    public mutating func popTop() -> T? {
        guard !isEmpty else { return nil }
        let item = heap.first
        if count > 1 {
            heap[0] = heap.removeLast()
            heapify(idx: 0)
        } else {
            heap.removeLast()
        }
        return item
    }
}
