//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/jump-game/

class Solution {
    //暴力  超时 从index 0 开始查找
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        return helper(nums, 0)
    }
    func helper(_ nums: [Int], _ index: Int) -> Bool {
        guard nums[index]>0 else { return false }
        let c = nums.count
        var i = nums[index]
        while i>0 {
            print(index)
            if index+i < c-1 {
                if helper(nums, index+i) {
                    return true
                }
            } else if index+i == c-1 {
                return true
            }
            i -= 1
        }
        return false
    }
    // 反向  从后往前 递归 回溯
    func canJump2(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        var k = 0
        for i in 0..<nums.count {
            if i > k { return false }
            k = max(k,i+nums[i])
        }
        return true
    }
}

let input = [2,0]
Solution().canJump2(input)
