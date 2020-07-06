//: [Previous](@previous)

import Foundation

/*
 5. 最长回文子串
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：

 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 示例 2：

 输入: "cbbd"
 输出: "bb"
 */

/*思路
    选择一个值作为中间值
 */
func longestPalindrome(_ s: String) -> String {

    var subString = ""
    for i in 0..<s.count {
        for j in 0..<s.count {
            if j == 0 {
            var left = i-1
            var right = i+1
            if left<0 || right>s.count-1 {
                subString =
            }
        }

    }
    return subString
}

