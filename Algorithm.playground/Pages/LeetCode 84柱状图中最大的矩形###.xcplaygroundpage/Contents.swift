//: [Previous](@previous)

import Foundation
//https://leetcode-cn.com/problems/largest-rectangle-in-histogram/
//高度由最低的一个柱子的决定
class Solution {
    //暴力法O(n^2) 超时
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var r = 0
        var low = 0
        for i in 0..<heights.count {
            r = max(heights[i], r)
            low = heights[i]
            for j in i+1..<heights.count {
                low = min(heights[j], low)
                r = max(r, (j-i+1)*low)
            }
        }
        return r
    }

    //栈用height的index 入栈，如果下一个需要入栈的i对应的高度 低于栈尾的高度 则 出栈，出栈后再用i减去新的栈尾的index再减1则为宽度，
    //如果出栈后栈空了  说明出栈的这个i对应的高度为 最低高度 宽度应该尾heights的count
    //O(n) 空间O(n)
    func largestRectangleArea1(_ heights: [Int]) -> Int {
        guard heights.count > 0 else { return 0 }
        guard heights.count > 1 else { return heights[0] }
        var r = 0
        var stack = [Int]()
        for i in 0..<heights.count {
            while stack.count != 0 && heights[stack.last!] > heights[i] {
                let culH = heights[stack.last!]
                var width = 1
                while stack.count != 0 && culH == heights[stack.last!]  {
                    stack.removeLast()
                }
                if stack.count == 0 {
                    width = i
                } else {
                    width = i-stack.last!-1
                }
                r = max(culH*width, r)
            }
            stack.append(i)
        }

        while stack.count != 0 {
            let culH = heights[stack.last!]
            stack.removeLast()
            var width = 1
            if stack.count == 0 {
                width = heights.count
            } else {
                width = heights.count-stack.last!-1
            }
            r = max(culH*width, r)
        }
        return r
    }
    //哨兵
    //比如新建一个链表时候 创建一个默认的head 然后让a = head， 用a来依次执行后续创建的节点而 head时不变的
    //返回时 可以直接返回head.next即可，head就是一个哨兵
    //本题可以再height首尾分别加上一个高度尾0的哨兵 使代码更加简洁 易读
    //O(n) 空间O(n)
    func largestRectangleArea2(_ heights: [Int]) -> Int {
        var nHeihgts = [Int](repeating: 0, count: heights.count+2)
        for i in 0..<heights.count {//将原heights填入带哨兵的数组
            nHeihgts[i+1] = heights[i]
        }
        var r = 0
        var stack = [Int]()
        stack.append(nHeihgts.first!)
        for i in 1..<nHeihgts.count {//不会再越界  不用判断stack为空
            while nHeihgts[i] < nHeihgts[stack.last!]  {
                let culH = nHeihgts[stack.last!]
                stack.removeLast()
                while culH == nHeihgts[stack.last!] {
                    stack.removeLast()
                }
                let width = i-stack.last!-1
                r = max(culH*width, r)
            }
            stack.append(i)
        }
        //因为末尾哨兵高度0保证栈中有效的高度都能出栈，所以不需要再遍历stack

        return r
    }
}

Solution().largestRectangleArea2([4,2,0,3,2,5])
