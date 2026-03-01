import Foundation

//https://leetcode.com/problems/largest-rectangle-in-histogram/description/

class Solution {
    struct Bar {
        let idx: Int
        let height: Int
    }

    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxArea: Int = 0
        var stack: [Bar] = []
        for (idx, ht) in heights.enumerated() {
            var start = idx
            while !stack.isEmpty && stack.last!.height >= ht {
                let last = stack.removeLast()
                let area = (idx - last.idx) * last.height // imp - remember we are using stack last height, not the cur bar height
                maxArea = max(maxArea, area)
                start = last.idx
            }
            stack.append(Bar(idx: start, height: ht))
        }
        for bar in stack {
            let area = (heights.count - bar.idx) * bar.height
            maxArea = max(maxArea, area)
        }
        return maxArea
    }
}
