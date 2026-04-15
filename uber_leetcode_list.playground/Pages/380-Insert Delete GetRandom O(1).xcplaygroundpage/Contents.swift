import Foundation

//https://leetcode.com/problems/insert-delete-getrandom-o1/

class RandomizedSet {
    private var idxMap: [Int: Int]
    private var store: [Int]

    init() {
        idxMap = [:]
        store = []
    }

    func insert(_ val: Int) -> Bool {
        if let idx = idxMap[val] {
            return false
        }
        store.append(val)
        idxMap[val] = store.count - 1
        return true
    }

    func remove(_ val: Int) -> Bool {
        guard let idx = idxMap[val] else {
            return false
        }
        let lastVal = store[store.count - 1]
        store[idx] = lastVal
        idxMap[lastVal] = idx
        store.removeLast()
        idxMap.removeValue(forKey: val)
        return true
    }

    func getRandom() -> Int {
        let randIdx = Int.random(in: 0..<store.count)
        return store[randIdx]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
