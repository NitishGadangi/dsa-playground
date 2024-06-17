import Foundation

//https://leetcode.com/problems/zigzag-conversion/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        let inpArr = Array(s)
        var strArr = [String]()
        (1...numRows).forEach { _ in
            strArr.append("")
        }

        var idx = 0
        while idx < inpArr.count {
            // top to bottom --- 0 to end
            for subIdx in stride(from: 0, to: numRows, by: 1) where idx < inpArr.count {
                let curInp = inpArr[idx]
                strArr[subIdx].append(curInp)
                idx += 1
            }

            // cross bottom to top --- (end - 1) to 1
            for subIdx in stride(from: numRows - 2, to: 0, by: -1) where idx < inpArr.count {
                let curInp = inpArr[idx]
                strArr[subIdx].append(curInp)
                idx += 1
            }
        }
        let res = strArr.joined(separator: "")
        return res
    }
}

let test = Solution()
test.convert("PAYPALISHIRING", 4)
