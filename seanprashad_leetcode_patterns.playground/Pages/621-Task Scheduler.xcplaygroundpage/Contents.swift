import Foundation

//https://leetcode.com/problems/task-scheduler/

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var maxHeap = Heap<Int> { l, r in
            l > r
        }
        var freq: [Character: Int] = [:]
        for task in tasks {
            freq[task, default: 0] += 1
        }
        for (task, count) in freq {
            maxHeap.insert(item: count)
        }
        
        var time = 0
        while maxHeap.isNotEmpty {
            var cycle = 0
            var refill: [Int] = []
            while cycle < n + 1 && maxHeap.isNotEmpty {
                let curFreq = maxHeap.popTop()!
                if curFreq > 1 {
                    refill.append(curFreq - 1)
                }
                cycle += 1
            }
            for cnt in refill {
                maxHeap.insert(item: cnt)
            }
            time += maxHeap.isEmpty ? cycle : n + 1
        }
        return time
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
