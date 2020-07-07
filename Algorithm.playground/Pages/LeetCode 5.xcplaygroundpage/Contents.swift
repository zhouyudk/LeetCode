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
 遍历所有子串
    1、将String转换为Array 方便快速取值
    2、以left和right记录满足条件的子串 边界值。
    3、单独对初始字符连续出现的情况 进行left和right调整
    4
 */
func longestPalindrome(_ s: String) -> String {
    guard s.count > 1 else { return s }
    var array: [Character] = []
    let lenght = s.count
    for c in s {
        array.append(c)
    }
    let cutString: ((Int,Int)->String) = { start, end in
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end)
        return String(s[startIndex...endIndex])
    }
    var subStr = ""
    var lastSubStrLenght = 0
    for i in 0..<lenght {
        var left = i
        var right = i
        //起始值连续相等情况
        while left-1>=0 {
            if array[left-1] == array[i] {
                left -= 1
            } else {
                break
            }
        }

        while right+1<=lenght-1 {
            if array[right+1] == array[i] {
                right += 1
            } else {
                break
            }
        }
        //left 和 right在范围内 则判断对应字符是否相等，出现不相等后结束环
        while left-1>=0 && right+1<=lenght-1 {
            if array[left-1] == array[right+1] {
                left -= 1
                right += 1
            } else {
                break
            }
        }

        if right-left+1>lastSubStrLenght  {
            print(left,right)
            subStr = cutString(left,right)
            lastSubStrLenght = right-left+1
        }
    }

    return subStr
}

