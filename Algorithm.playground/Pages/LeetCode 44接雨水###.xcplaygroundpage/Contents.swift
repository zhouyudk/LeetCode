//: [Previous](@previous)

import Foundation

///https://leetcode-cn.com/problems/trapping-rain-water/

//使用栈 柱子index依次入栈 当新入栈的柱子 比当前柱子高时 且栈顶弹出后 不为空  则当前柱子可蓄水高度为 min(current,新栈顶)-之前弹出的栈顶高度 则为可蓄水高度，依次,
//注意计算每个柱子的可蓄水高度时 是从当前柱子的最大高度与界定高度之差  左右扩散的面积
/*
 |        |
 | |------|
 | |   |  |
 | | | |  |
 */
class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else { return 0 }
        var r = 0
        var stack = [Int]()
        for i in 1..<height.count {
            while !stack.isEmpty && height[i] > height[stack.last!] {
                let culH = height[stack.last!]
                stack.removeLast()
                if stack.isEmpty {
                    break
                }
                let w = i-stack.last!-1
                r += (min(height[i], height[stack.last!])-culH) * w
            }
            stack.append(i)
        }
        return r
    }
    //双指针加 左右最大高度记录 最巧妙
}
