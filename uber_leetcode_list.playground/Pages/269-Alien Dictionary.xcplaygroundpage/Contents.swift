import Foundation

//https://neetcode.io/problems/foreign-dictionary/question

class Solution {
    func foreignDictionary(_ words: [String]) -> String {
        var adjList: [Character: Set<Character>] = [:]
        var inDegree: [Character: Int] = [:]
        for word in words {
            for ch in word {
                adjList[ch] = Set<Character>()
                inDegree[ch] = 0
            }
        }
        for idx in 0..<(words.count - 1) {
            let w1 = words[idx]
            let w2 = words[idx + 1]
            let minLen = min(w1.count, w2.count)
            if w1.count > w2.count && w1.prefix(minLen) == w2.prefix(minLen) {
                // error case
                // If two strings have same prefix and still the longer length is ahead.
                return ""
            }
            let w1Arr = Array(w1)
            let w2Arr = Array(w2)
            for idx in 0..<minLen {
                let curW1 = w1Arr[idx]
                let curW2 = w2Arr[idx]
                if curW1 == curW2 { continue }
                if !adjList[curW1]!.contains(curW2) {
                    adjList[curW1]!.insert(curW2)
                    inDegree[curW2]! += 1
                }
                break
            }
        }
        var queue: [Character] = []
        for (ch, deg) in inDegree {
            if deg == 0 {
                queue.append(ch)
            }
        }
        var res: [Character] = []
        while !queue.isEmpty {
            let curCh = queue.removeFirst()
            res.append(curCh)
            for depCh in adjList[curCh]! {
                inDegree[depCh]! -= 1
                if inDegree[depCh]! == 0 {
                    queue.append(depCh)
                }
            }
        }
        if res.count == inDegree.count {
            return res.map { String($0) }.joined()
        }
        return ""
    }
}

