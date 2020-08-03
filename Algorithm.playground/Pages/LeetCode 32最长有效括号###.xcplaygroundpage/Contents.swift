//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/longest-valid-parentheses/
//栈
//)()  (()   ()(   (((  )))    ()()(  ()(()(()()  ((())(()()))
class Solution {
    let left = Character("(")
    let right = Character(")")
    func longestValidParentheses(_ s: String) -> Int {
        let sArr = Array(s)
        var stack = [Character]()
        var stackCount = stack.count
        var r = 0
        var tmpR = 0
        for c in s {
            if stack.count == 0 {
                if c == right {
                    r = max(r, tmpR)
                    tmpR = 0
                    continue
                } else {
                    stack.append(c)
                }
            } else {
                if c == left {
                    stack.append(c)
                } else {
                    tmpR += 2
                    stack.removeLast()
                }
            }
        
            
        }
        return r
    }
}
