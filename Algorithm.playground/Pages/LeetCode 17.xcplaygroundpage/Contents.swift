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
    let digitMap = [2: ["a","b","c"],
                     3: ["d","e","f"],
                     4: ["h","i","g"],
                     5: ["k","l","m"],
                     6: ["m","n","o"],
                     7: ["p","q","r"],
                     8: ["s","t","u"],
                     9: ["v","w","x","y"]]

    //暴力法
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        var rCount = 1
        digits.forEach { (c) in
            rCount *= digitMap[Int(c)]!.count
        }
//        var r = digits.first!
//        var tmp = r
    }
    
    func addChars() {
        for i in 0...rCount {
            
        }

    }
}
