//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count}
        var i = 1 //重复项的第一个
        var j = 1
        while j < nums.count {
            if nums[i-1] == nums[j] {
                j += 1
            } else {
                (nums[i], nums[j]) = (nums[j], nums[i])
                i += 1
                j += 1
            }
        }
        return i
    }
}
var numArray: [Int] = [1,1,1,2,2,3,3]
Solution().removeDuplicates(&numArray)
