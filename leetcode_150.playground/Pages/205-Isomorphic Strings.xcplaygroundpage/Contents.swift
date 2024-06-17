import Foundation

//https://leetcode.com/problems/isomorphic-strings/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        s.map { s.index(of: $0)! } == t.map { t.index(of: $0)! }
    }
}
