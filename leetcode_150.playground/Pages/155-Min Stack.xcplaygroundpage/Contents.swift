import Foundation

//https://leetcode.com/problems/min-stack/?envType=study-plan-v2&envId=top-interview-150
class MinStack {
    var stack: [Int]
    var minStack: [Int]

    init() {
        stack = [Int]()
        minStack = [Int]()
    }

    func push(_ val: Int) {
        let minItem = min(minStack.last ?? Int.max, val)
        minStack.append(minItem)
        stack.append(val)
    }

    func pop() {
        stack.popLast()
        minStack.popLast()
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

