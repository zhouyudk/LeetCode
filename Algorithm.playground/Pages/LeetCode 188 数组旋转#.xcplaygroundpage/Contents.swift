//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/rotate-array/

//逐一旋转 每次移动一个元素时间复杂度O(n*k)
class Solution {
    //直接插入删除
    func rotate1(_ nums: inout [Int], _ k: Int) {
        for _ in 0..<k {
            nums.insert(nums[nums.count-1], at: 0)
            nums.removeLast()
        }
    }
    
    //
    func rotate2(_ nums: inout [Int], _ k: Int) {
//        nums.inde
        var sub = nums[nums.count-k..<nums.count]//nums.index(0, offsetBy: nums.count-k),nums.index(0, offsetBy: nums.count-1)
        nums = sub + nums
         var dd = nums[0..<nums.count-k]
    }
    //翻转
    func rotate(_ nums: inout [Int], _ k: Int) {
        var kk = k%nums.count
        reverse(&nums, 0, nums.count-1)
        print(nums)
        reverse(&nums, 0, kk-1)
        print(nums)
        reverse(&nums, kk, nums.count-1)
    }
    
    func reverse(_ nums: inout [Int], _ s: Int, _ e: Int) {
        var i = 0
        while s+i <= e-i  {
            (nums[s+i], nums[e-i]) = (nums[e-i], nums[s+i])
            i += 1
        }
//        print(nums)
    }
}
var dddd = [1,3,2,5,6,1,3,5]
Solution().rotate(&dddd, 2)
