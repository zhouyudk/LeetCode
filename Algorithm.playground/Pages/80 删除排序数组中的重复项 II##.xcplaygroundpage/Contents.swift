//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array-ii/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 2 else { return nums.count }
        var len = 2
        for i in 2..<nums.count {
            if nums[i] != nums[len-1] || nums[i] != nums[len-2] {
                nums[len] = nums[i]
                len += 1
            }
        }
        return len
    }
}

var s = [1,1,1,2,2,3]

Solution().removeDuplicates(&s)
