//: [Previous](@previous)

import Foundation

/*17. 电话号码的字母组合
 难度
 中等
 
 801
 
 收藏
 
 分享
 切换为英文
 关注
 反馈
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
 
 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 
 
 
 示例:
 
 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 说明:
 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。
 */

class Solution {
        let digitMap = ["2": ["a","b","c"],
                     "3": ["d","e","f"],
                     "4": ["g","h","i"],
                     "5": ["j","k","l"],
                     "6": ["m","n","o"],
                     "7": ["p","q","r","s"],
                     "8": ["t","u","v"],
                     "9": ["w","x","y","z"]]
    func letterCombinations1(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        var r = [""]
        var loopCount = 1//digitMap[String(digits.first!)]!.count
        for c in digits {
            var tmpR = [String]()
            loopCount *= digitMap[String(c)]!.count
            for i in 0..<loopCount {
                tmpR.append(r[i/digitMap[String(c)]!.count]+digitMap[String(c)]![i%digitMap[String(c)]!.count])
            }
            r = tmpR
        }
        return r
    }
    //递归--参考题解
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        digitsArr = Array(digits)
        for s in digitMap[String(digits.first!)]! {
            iterateStr(index: 1, str: s)
        }
        return result
    }
    var result = [String]()
    var digitsArr = [Character]()
    func iterateStr(index: Int, str: String) {
        if index == digitsArr.count {
            result.append(str)
            return
        }
        for s in digitMap[String(digitsArr[index])]! {
            let tmpS = str+s
            iterateStr(index: index+1, str: tmpS)
        }
    }
}

Solution().letterCombinations("234")
