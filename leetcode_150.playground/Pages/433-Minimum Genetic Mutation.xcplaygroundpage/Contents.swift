import Foundation

//https://leetcode.com/problems/minimum-genetic-mutation/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        guard startGene != endGene && 
                !bank.isEmpty &&
                bank.contains(endGene)
        else { return -1 }

        let geneArr = Array("ACGT")
        var bank = Set<String>(bank)
        var queue: [(String, Int)] = [(startGene, 0)]

        while !queue.isEmpty {
            let (curGene, numOfSteps) = queue.removeFirst()

            if curGene == endGene {
                return numOfSteps
            }

            let curGeneArr = Array(curGene)

            for idx in 0..<curGene.count {
                for gene in geneArr {
                    let mutatedGene = String(curGeneArr.replaceItem(at: idx, with: gene))
                    if bank.contains(mutatedGene) {
                        queue.append((mutatedGene, numOfSteps + 1))
                        bank.remove(mutatedGene)
                    }
                }
            }
        }

        return -1
    }
}

extension Array {
    func replaceItem(at: Int, with: Element) -> Array {
        if at == 0 {
            return [with] + self[1..<count]
        } else if at == (count - 1) {
            return self[0..<(count-1)] + [with]
        } else {
            return Array(self[0..<at] + [with] + self[(at + 1)..<count])
        }
    }
}
