import Foundation

// https://leetcode.com/problems/largest-rectangle-in-histogram/description/

class Solution {
    struct Bar {
        let height: Int
        let idx: Int
    }
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var res: Int = Int.min
        var stack: [Bar] = [] //monotonic increasing stack
        for (idx, ht) in heights.enumerated() {
            // store index of last item on left whose ht is > cur ht
            // so then we cal curArea we consider left extension as well
            var start = idx
            while !stack.isEmpty && stack.last!.height > ht {
                let last = stack.removeLast()
                let curArea = last.height * (idx - last.idx)
                res = max(res, curArea)
                start = last.idx
            }
            stack.append(Bar(height: ht, idx: start))
        }
        for bar in stack {
            let curArea = bar.height * (heights.count - bar.idx)
            res = max(res, curArea)
        }
        return res
    }
}
