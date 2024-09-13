import Foundation

//https://leetcode.com/problems/decode-string

class Solution {
    func decodeString(_ s: String) -> String {
        var stack = [String]()
        for char in s {
            if char != "]" {
                stack.append(String(char))
            } else {
                var encStr = [String]()
                // extract enc str
                while !stack.isEmpty && stack.last != "[" {
                    let lastItem = stack.removeLast()
                    encStr.insert(lastItem, at: 0)
                }
                // remove [
                stack.removeLast()

                //extract digits
                var num = ""
                while !stack.isEmpty && Int(stack.last!) != nil {
                    num = stack.removeLast() + num
                }

                print(num)
                print(encStr)

                if let count = Int(num) {
                    let decodedArr = Array(repeating: encStr.joined(), count: count)
                    stack.append(contentsOf: decodedArr)
                }
            }
        }
        return stack.joined()
    }
}

let test = Solution().decodeString("100[leetcode]")
