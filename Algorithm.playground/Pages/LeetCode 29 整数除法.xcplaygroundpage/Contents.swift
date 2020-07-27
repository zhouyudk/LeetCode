//: [Previous](@previous)

import Foundation

/*https://leetcode-cn.com/problems/divide-two-integers/
 29. 两数相除
 给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。

 返回被除数 dividend 除以除数 divisor 得到的商。

 整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2



 示例 1:

 输入: dividend = 10, divisor = 3
 输出: 3
 解释: 10/3 = truncate(3.33333..) = truncate(3) = 3
 示例 2:

 输入: dividend = 7, divisor = -3
 输出: -2
 解释: 7/-3 = truncate(-2.33333..) = -2


 提示：

 被除数和除数均为 32 位有符号整数。
 除数不为 0。
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−2^31,  2^31 − 1]。本题中，如果除法结果溢出，则返回 2^31 − 1。
 */

class Solution {
    //暴力法
    func divide1(_ dividend: Int, _ divisor: Int) -> Int {
        //唯一的溢出情况
        if dividend == 0 { return 0 }
        if divisor == -1 {
            if dividend == Int32.min {
                return Int(Int32.max)
            } else {
                return -dividend
            }
        }
        if divisor == 1 { return dividend }
        var r = 0
        var d = dividend
        //区分被除数时正数还是负数
        if d < 0 && divisor > 0 {
            while d <= 0-divisor {
                r -= 1
                d += divisor
            }
        } else if d < 0 && divisor < 0 {
            while d <= divisor {
                r += 1
                d -= divisor
            }
        } else if d > 0 && divisor > 0 {
            while d >= divisor {
                r += 1
                d -= divisor

            }
        } else if d > 0 && divisor < 0 {
            while d >= 0-divisor {
                r -= 1
                d += divisor
            }
        }
        return r
    }
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
    //唯一的溢出情况
        if dividend == 0 { return 0 }
        if divisor == -1 {
            if dividend == Int32.min {
                return Int(Int32.max)
            } else {
                return -dividend
            }
        }
        if divisor == 1 { return dividend }
        var isPositive = (dividend>0 && divisor>0) || (dividend<0 && divisor<0)
        var dd = dividend<0 ? dividend : -dividend
        var ds = divisor<0 ? divisor: -divisor //使用负数以免越界
        var r = div(dd,ds)
        return isPositive ? r : -r
    }

    //使用负数 以免越界
    func div(_ a: Int, _ b: Int) -> Int {
        if a>b { return 0 }
        var r = 0
        var count = 1 // b的多少倍
        var bb = b
        while bb+bb > a  {
            count += count
            bb += bb
        }
        return count+div(a-bb,b)
    }
}

Solution().divide(100, -2)
