//: [Previous](@previous)

import Foundation

/*
 11. 盛最多水的容器
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 说明：你不能倾斜容器，且 n 的值至少为 2。





 图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。



 示例：

 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 */

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxA = 0
        var i = 0
        var j = height.count-1
        while i<=j {
            if height[i] < height[j] {
                maxA = max(height[i]*(j-i), maxA)
                i += 1
            } else {
                maxA = max(height[j]*(j-i), maxA)
                j -= 1
            }
        }
        return maxA
    }
}

Solution().maxArea([1,1,1,1,1,2,2,1,1,1,1,1,1])
