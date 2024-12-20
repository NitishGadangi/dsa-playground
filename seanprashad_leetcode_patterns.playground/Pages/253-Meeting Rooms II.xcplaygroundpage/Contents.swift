import Foundation

//https://leetcode.com/problems/meeting-rooms-ii/

class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var intervals = intervals.sorted { first, second in
            first[0] < second[0]
        }
        var minHeap = Heap<[Int]> { l, r in
            l[1] < r[1]
        }
        
        for intr in intervals {
            if minHeap.isNotEmpty && minHeap.getTop()![1] <= intr[0] {
                minHeap.popTop()
            }
            minHeap.insert(item: intr)
        }
        
        return minHeap.count
    }
}

class SolutionWithoutHeap {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var starts: [Int] = []
        var ends: [Int] = []
        for inter in intervals {
            starts.append(inter[0])
            ends.append(inter[1])
        }
        starts = starts.sorted()
        ends = ends.sorted()
        var sptr = 0
        var eptr = 0
        var num = 0
        while sptr < intervals.count {
            if starts[sptr] >= ends[eptr] {
                num -= 1
                eptr += 1
            }
            
            sptr += 1
            num += 1
        }
        return num
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
