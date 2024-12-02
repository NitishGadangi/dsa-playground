import Foundation

//https://leetcode.com/problems/reorganize-string/

class Solution {
    struct Item {
        let ch: Character
        let fq: Int
    }
    
    func reorganizeString(_ s: String) -> String {
        var freqs: [Character: Int] = [:]
        for ch in s {
            freqs[ch, default: 0] += 1
        }
        
        var maxHeap = Heap<Item> { l, r in
            l.fq > r.fq
        }
        for (ch, fq) in freqs {
            let item = Item(ch: ch, fq: fq)
            maxHeap.insert(item: item)
        }
        var res = ""
        while maxHeap.isNotEmpty {
            let first = maxHeap.popTop()!
            if res.count == 0 || Array(res).last! != first.ch {
                res += "\(first.ch)"
                if first.fq > 1 {
                    maxHeap.insert(item: Item(ch: first.ch, fq: first.fq - 1))
                }
            } else if maxHeap.isNotEmpty {
                let second = maxHeap.popTop()!
                res += "\(second.ch)"
                if second.fq > 1 {
                    maxHeap.insert(item: Item(ch: second.ch, fq: second.fq - 1))
                }
                maxHeap.insert(item: first)
            } else {
                return ""
            }
        }
        
        return res
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
