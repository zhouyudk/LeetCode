//: [Previous](@previous)
//https://leetcode-cn.com/problems/generate-parentheses/
import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        return generate(n,n,"")
    }

    func generate(_ left: Int, _ right: Int, _ s: String) -> [String] {
        if left <= 0 || right < left { return [] }
        if left == 0 && right == 0 { return [s] }
        return generate(left, right-1, s+")") + generate(left-1, right, s+"(")
    }
}

Solution().generateParenthesis(3)
