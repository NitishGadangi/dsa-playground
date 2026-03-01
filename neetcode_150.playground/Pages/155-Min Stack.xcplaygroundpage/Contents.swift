import Foundation

//https://leetcode.com/problems/min-stack/

class MinStack {

    var stack: [Int] = []
    var minStack: [Int] = []

    init() {
        stack = []
        minStack = []
    }

    func push(_ val: Int) {
        stack.append(val)
        let minVal = min(minStack.last ?? Int.max, val)
        minStack.append(minVal)
    }

    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }

    func top() -> Int {
        stack.last ?? 0
    }

    func getMin() -> Int {
        minStack.last ?? 0
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

