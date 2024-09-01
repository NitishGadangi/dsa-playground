import Foundation

//https://leetcode.com/problems/search-suggestions-system/

class Solution {

    // Two Pointer
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        let products = products.sorted()
        let threshold = 3
        var res: [[String]] = []

        var left = 0
        var right = products.count - 1
        for (idx, strIdx) in searchWord.indices.enumerated() {
            let curChar = searchWord[strIdx]
            let curLen = idx + 1
            while left <= right && ((products[left].count < curLen) || (products[left][strIdx] != curChar)) {
                left += 1
            }
            while left <= right && ((products[right].count < curLen) || (products[right][strIdx] != curChar)) {
                right -= 1
            }

            // take top 3 valid items between left & right
            var subRes: [String] = []
            for subIdx in stride(from: left, through: min(left + 2, right), by: 1) {
                subRes.append(products[subIdx])
            }

            res.append(subRes)
        }
        return res
    }
}
