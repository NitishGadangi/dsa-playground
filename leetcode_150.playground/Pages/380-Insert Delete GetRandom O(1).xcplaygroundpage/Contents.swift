import Foundation

//https://leetcode.com/problems/insert-delete-getrandom-o1/?envType=study-plan-v2&envId=top-interview-150
class RandomizedSet {
    var set: Set<Int>

    init() {
        set = Set<Int>()
    }

    func insert(_ val: Int) -> Bool {
        if set.contains(val) {
            return false
        }
        set.insert(val)
        return true
    }

    func remove(_ val: Int) -> Bool {
        set.remove(val) != nil
    }

    func getRandom() -> Int {
        set.randomElement() ?? 0
    }
}
