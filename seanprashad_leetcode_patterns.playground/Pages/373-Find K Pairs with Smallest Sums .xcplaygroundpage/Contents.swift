import Foundation

//https://leetcode.com/problems/find-k-pairs-with-smallest-sums/

class Solution {
    struct Pair: Comparable {
        static func < (lhs: Solution.Pair, rhs: Solution.Pair) -> Bool {
            return lhs.val < rhs.val
        }
        
        let val: Int
        let i: Int
        let j: Int
    }
    
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var minHeap = Heap<Pair> { l, r in
            return l < r
        }
        var visited = Set<[Int]>()
        var res: [[Int]] = []
        var k = k
        minHeap.insert(item: Pair(val: nums1[0] + nums2[0], i: 0, j: 0))
        visited.insert([0, 0])
        
        while k > 0 && minHeap.isNotEmpty {
            let curPair = minHeap.popTop()!
            let i = curPair.i
            let j = curPair.j
            res.append([nums1[i], nums2[j]])
            
            if i + 1 < nums1.count && !visited.contains([i + 1, j]) {
                let val = nums1[i + 1] + nums2[j]
                minHeap.insert(item: Pair(val: val, i: i + 1, j: j))
                visited.insert([i + 1, j])
            }
            if j + 1 < nums2.count && !visited.contains([i, j + 1]) {
                let val = nums1[i] + nums2[j + 1]
                minHeap.insert(item: Pair(val: val, i: i, j: j + 1))
                visited.insert([i, j + 1])
            }
            k -= 1
        }
        
        return res
    }
}

struct Heap<T: Comparable> {
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
        guard let left = getLeftChildIdx(parent: idx),
              let right = getRightChildIdx(parent: idx)
        else { return }
        
        var comp = idx
        if comparator(heap[left], heap[comp]) {
            comp = left
        }
        if comparator(heap[right], heap[comp]) {
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
        var item: T? = heap.first
        if count > 1 {
            heap[0] = heap[count - 1]
            heap.removeLast()
            heapify(idx: 0)
        } else if count == 1 {
            heap.removeLast()
        } else {
            return nil
        }
        return item
    }
}
