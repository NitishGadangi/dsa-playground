import Foundation

//https://leetcode.com/problems/candy/?envType=study-plan-v2&envId=top-interview-150
class Solution {
    func candy(_ ratings: [Int]) -> Int {
        let l2rArr = leftToRightMaxArr(ratings: ratings)
        let r2lArr = rightToLeftMaxArr(ratings: ratings)
        print(l2rArr)
        print(r2lArr)
        precondition((l2rArr.count == r2lArr.count) && (r2lArr.count == ratings.count), "wrong arrays")
        var resArr = [Int]()
        for idx in stride(from: 0, to: ratings.count, by: 1) {
            let l2rVal = l2rArr[idx]
            let r2lVal = r2lArr[idx]
            let maxVal = max(l2rVal, r2lVal)
            resArr.append(maxVal)
        }
        let res = resArr.reduce(0) { res, ele in
            return res + ele
        }
        return res
    }

    func leftToRightMaxArr(ratings: [Int]) -> [Int] {
        var res = [Int]()
        for idx in stride(from: 0, to: ratings.count, by: 1) {
            guard idx > 0 else {
                res.append(1)
                continue
            }
            let curRat = ratings[idx]
            let prevRat = ratings[idx - 1]
            let prevVal = res[idx - 1]
            if curRat > prevRat {
                res.append(prevVal + 1)
            } else {
                res.append(1)
            }
        }
        return res
    }

    func rightToLeftMaxArr(ratings: [Int]) -> [Int] {
        var res = [Int]()
        for idx in stride(from: ratings.count - 1, through: 0, by: -1) {
            print(idx)
            guard idx < (ratings.count - 1) else {
                res.append(1)
                continue
            }
            let curRat = ratings[idx]
            let prevRat = ratings[idx + 1]
            let prevVal = res[0]
            if curRat > prevRat {
                res.insert(prevVal + 1, at: 0)
            } else {
                res.insert(1, at: 0)
            }
        }
        return res
    }
}

let solution = Solution()
solution.candy([1,0,2])
