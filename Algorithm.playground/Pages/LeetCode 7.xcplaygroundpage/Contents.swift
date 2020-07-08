//: [Previous](@previous)

import Foundation
/*
 7. 整数反转
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

 示例 1:

 输入: 123
 输出: 321
  示例 2:

 输入: -123
 输出: -321
 示例 3:

 输入: 120
 输出: 21
 注意:

 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2^31,  2^31 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-integer
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        guard x > 9 || x < -9 else { return x}
        var result = 0
        var tmp = x
        while tmp != 0 {
            if result>Int32.max/10 || (result==Int32.max/10 && tmp%10>Int32.max%10){
                return 0
            }
            if  result<Int32.min/10 || (result==Int32.min/10 && tmp%10<Int32.min%10) {
                return 0
            }
            result = result*10+tmp%10
            tmp /= 10
        }
        return result
    }
}

Solution().reverse(463847412)
