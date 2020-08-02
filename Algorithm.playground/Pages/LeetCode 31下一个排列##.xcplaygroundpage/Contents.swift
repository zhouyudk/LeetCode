//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/next-permutation/

//从后往前遍历 找地第一个降序 的交换
//如果 从后往前始终增大 则 翻转数组
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count-2
        while i>=0 && nums[i] >= nums[i+1] {
            i -= 1
        }
        print(i)
        if i >= 0 {
            var k = nums.count-1
            while k>i {
                if nums[k] > nums[i] {
                    (nums[k], nums[i]) = (nums[i], nums[k])
                    return
                }
                k -= 1
            }
        } else {
            var j = 0
            print(nums)
            while j < nums.count-1-j {
                (nums[j], nums[nums.count-1-j]) = (nums[nums.count-1-j], nums[j])
                j += 1
            }
        }
    }
}

var dd = [1,4,3,2,1]
Solution().nextPermutation(&dd)
print(dd)
