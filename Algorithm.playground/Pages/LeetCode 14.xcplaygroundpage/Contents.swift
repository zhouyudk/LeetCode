//: [Previous](@previous)

import Foundation

/*14. 最长公共前缀
编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 ""。

示例 1:

输入: ["flower","flow","flight"]
输出: "fl"
示例 2:

输入: ["dog","racecar","car"]
输出: ""
解释: 输入不存在公共前缀。
说明:

所有输入只包含小写字母 a-z 。
 */

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return ""}
        var strArr: Array<Array<Character>> = []
        for s in strs {
            strArr.append(Array(s))
        }
        var c: Character!
        var end = 0
        out: for i in 0..<strArr[0].count {
            c = strArr[0][i]
            for j in 1..<strArr.count {
                if i > strArr[j].count-1 || c != strArr[j][i] {
                    break out
                }
            }
            end += 1
        }
        return String(strArr[0].prefix(end))
    }
}

Solution().longestCommonPrefix(["flower","flow","flight"])
