import Foundation

//https://leetcode.com/problems/minimum-genetic-mutation

class Solution {
    struct Mut {
        let gene: String
        let count: Int
    }
    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        var bankSet = Set<String>(bank)
        guard startGene.count == endGene.count
                && !bank.isEmpty
                && bank.contains(endGene)
        else { return -1 }
        guard startGene != endGene else { return 0 }
        var queue: [Mut] = [Mut(gene: startGene, count: 0)]
        
        var genArr = Array("ACGT")
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            if cur.gene == endGene {
                return cur.count
            }
            var curGenArr = Array(cur.gene)
            var endGenArr = Array(endGene)
            for gen in genArr {
                for idx in 0..<curGenArr.count {
                    guard curGenArr[idx] != endGenArr[idx] else { continue }
                    var newGenArr = curGenArr
                    newGenArr[idx] = gen
                    let newGen = String(newGenArr)
                    if endGenArr[idx] == gen && bankSet.contains(newGen) {
                        queue.append(Mut(gene: newGen, count: cur.count + 1))
                        bankSet.remove(newGen)
                    }
                }
                
            }
        }
        return -1
    }
}

let res = Solution().minMutation("AACCGGTT", "AAACGGTA", ["AACCGGTA","AACCGCTA","AAACGGTA"])

