//: [Previous](@previous)

import Foundation

/*
 9. 回文数
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 示例 1:

 输入: 121
 输出: true
 示例 2:

 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 示例 3:

 输入: 10
 输出: false
 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 进阶:

 你能不将整数转为字符串来解决这个问题吗？
 */

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x%10 == 0 && x != 0) { return false }
        if x < 10 { return true }
        var xArr:  Array<Int> = []
        var tmp = x
        while tmp != 0 {
            xArr.append(tmp%10)
            tmp /= 10
        }
        for i in 0..<xArr.count {
            if xArr[i] != xArr[xArr.count-1-i] {
                return false
            }
        }
        return true
    }
    //参考题解
    func isPalindrome1(_ x: Int) -> Bool {
        if x < 0 || (x%10 == 0 && x != 0) { return false }
        if x < 10 { return true }
        var tmp = x
        var targetNum = 0
        while tmp != 0 {
            targetNum = targetNum*10+tmp%10
            print(targetNum, tmp%10)
            if tmp == targetNum || tmp/10 == targetNum {
                return true
            }
            tmp /= 10
        }
        return false
    }
}
Solution().isPalindrome1(121)
