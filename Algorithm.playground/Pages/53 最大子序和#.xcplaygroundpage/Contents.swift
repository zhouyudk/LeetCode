//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/maximum-subarray/

//[-2,1,-3,4,-1,2,1,-5,4]
class Solution {
    //暴力 O(n^2)
    func maxSubArray(_ nums: [Int]) -> Int {
        var r = Int.min
        for i in 0..<nums.count-1 {
            var tmpr = nums[i]
            for j in i+1..<nums.count {
                tmpr += nums[j]
                r = max(tmpr, r)
                print(tmpr)
            }
        }
        return r
    }

    // O(n)
    func maxSubArray2(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0}
        var r = nums.first!
        var lastR = r
        for i in 1..<nums.count {
            lastR = max(nums[i] + lastR, nums[i])
            r = max(lastR, r)
        }
        return r
    }
}
Solution().maxSubArray2([-2,1,-3,4,-1,2,1,-5,4])
