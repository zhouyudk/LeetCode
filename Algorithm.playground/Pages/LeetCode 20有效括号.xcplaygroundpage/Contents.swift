//: [Previous](@previous)

import Foundation

/*20. 有效的括号
给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

有效字符串需满足：

左括号必须用相同类型的右括号闭合。
左括号必须以正确的顺序闭合。
注意空字符串可被认为是有效字符串。

示例 1:

输入: "()"
输出: true
示例 2:

输入: "()[]{}"
输出: true
示例 3:

输入: "(]"
输出: false
示例 4:

输入: "([)]"
输出: false
示例 5:

输入: "{[]}"
输出: true*/

/*思路
 至少有一组括号是连续的，优先查找到
 连续左括号  则有连续右括号对应
 如果右括号在左之前出现  则false
 */

let symbolMap = [Character("{"): Character("}"),
                 Character("["): Character("]"),
                 Character("("): Character(")")]
//继续优化 可以for index 判断剩余长度 < cArr长度  便return false
class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count != 0 else { return true }
        guard s.count % 2 == 0 && symbolMap[s.first!] != nil else { return false }
        var cArr = [Character]()
        for c in s {
            if let l = cArr.last, symbolMap[l] == c {
                cArr.removeLast()
            } else if symbolMap[c] != nil {
                cArr.append(c)
            } else {
                return false
            }
        }

        return cArr.count == 0
    }
}

Solution().isValid("{[](}")
