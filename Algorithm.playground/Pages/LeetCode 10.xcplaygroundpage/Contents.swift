//: [Previous](@previous)

import Foundation

/*
 10. 正则表达式匹配
 给你一个字符串 s 和一个字符规律 p，请你来实现一个支持 '.' 和 '*' 的正则表达式匹配。

 '.' 匹配任意单个字符
 '*' 匹配零个或多个前面的那一个元素
 所谓匹配，是要涵盖 整个 字符串 s的，而不是部分字符串。

 说明:

 s 可能为空，且只包含从 a-z 的小写字母。
 p 可能为空，且只包含从 a-z 的小写字母，以及字符 . 和 *。
 示例 1:

 输入:
 s = "aa"
 p = "a"
 输出: false
 解释: "a" 无法匹配 "aa" 整个字符串。
 示例 2:

 输入:
 s = "aa"
 p = "a*"
 输出: true
 解释: 因为 '*' 代表可以匹配零个或多个前面的那一个元素, 在这里前面的元素就是 'a'。因此，字符串 "aa" 可被视为 'a' 重复了一次。
 示例 3:

 输入:
 s = "ab"
 p = ".*"
 输出: true
 解释: ".*" 表示可匹配零个或多个（'*'）任意字符（'.'）。
 示例 4:

 输入:
 s = "aab"
 p = "c*a*b"
 输出: true
 解释: 因为 '*' 表示零个或多个，这里 'c' 为 0 个, 'a' 被重复一次。因此可以匹配字符串 "aab"。
 示例 5:

 输入:
 s = "mississippi"
 p = "mis*is*p*."
 输出: false
 */
/*
 思路
 */
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        //当表达式为空 则s为空则true不为空则false
        if p.count == 0 {
            return s.count == 0
        }
        var sArr: Array<Character> = []
        var pArr: Array<Character> = []
        /// "."
        let pointChar = Character(".")
        /// "#"
        let wellNumberChar = Character("#")
        /// "*"
        let asteriskChar = Character("*")
        for c in s {
            sArr.append(c)
        }
        for c in p {
            if c == asteriskChar && pArr.last == pointChar {
                if pArr.count-2>0 && pArr[pArr.count-2] == wellNumberChar {
                    continue
                }
                pArr[pArr.count-1] = wellNumberChar
            } else {
                pArr.append(c)
            }
        }
        //首先从后往前遍历p 直到找到*为止
        var sRight = sArr.count-1
        var pRight = pArr.count-1

        while sRight>=0 && pRight>=0 {
            if pArr[pRight] == wellNumberChar || pArr[pRight] == asteriskChar {
                break
            }
            if pArr[pRight] == pointChar || pArr[pRight] == sArr[sRight] {
                sRight -= 1
                pRight -= 1
                continue
            }
            return false
        }

        if sRight < 0 && pRight < 0 {
            return true
        } else {
            if sRight >= 0 {
                return false
             }
            if pRight == 0 && pArr[pRight] == wellNumberChar {
                return true
            } else {
                return false
            }
        }
//sRight 和 pRight 都是大于等于0的

        var sLeft = 0
        var pLeft = 0
        var wellNumIndex = -1//“#”号的index
        var asteriskIndex = -1//"*"对应的字符的index 如a*a 即为a的index
        while sLeft <= sRight && pLeft <= pRight {
            if pArr[pLeft] == pointChar || pArr[pLeft] == sArr[sLeft] {
                sLeft += 1
                pLeft += 1
                continue
            }
            //判断是否为“#”
            if pArr[pLeft] == wellNumberChar {
                if pLeft == pRight {
                    return true
                } else {
                    wellNumIndex = pLeft+1
                    pLeft += 1
                    continue
                }
            }
            //判断是否为“*”
            if pArr[pLeft] == asteriskChar {
                //将*号对应的字符配出来
                while sLeft <= sRight {

                }
                if pArr[pLeft-1] == pArr[pLeft+1] {

                }
            }
            //当出现“#”后的字符不匹配时
            if wellNumIndex != -1 {
                if pArr[pLeft] != sArr[sLeft] {
                    pLeft = wellNumIndex
                    sLeft += 1
                    continue
                }
            }
            //当出现“*”后的字符不匹配时

        }
        return true
    }
}
