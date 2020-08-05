//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/longest-valid-parentheses/
//栈
//)()  (()   ()(   (((  )))    ()()(  ()(()(()()  ((())(()()))   (((((()))))))
class Solution {
    let left = Character("(")
    let right = Character(")")
    
    //左括号 直接入栈 右括号 先弹出当前栈顶在入栈，  入栈的值为index
    func longestValidParentheses(_ s: String) -> Int {
        guard s.count > 1 else { return 0}
        let sArr = Array(s)
        var stack = [Int]()
        stack.append(-1)
        var r = 0
        for i in 0..<sArr.count {
            if sArr[i] == right {
                if stack.count > 0 {
                    stack.removeLast()
                }
                
                if stack.count > 0 {
                    r = max(r, i-stack.last!)
                } else {
                    stack.append(i)
                }
            } else {
                stack.append(i)
            }
        }
        return r
    }
    //动态规划
    
    //用l和r计数 left和right的个数  当l和r相等时  括号合法  计算长度， 反向再来一遍  因为存在始终l>r的情况，反向 先加r
}

Solution().longestValidParentheses("((()")
