//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/remove-element/

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var j = nums.count-1
        while i <= j {
            if nums[i] != val {
                i += 1
            } else {
                if nums[j] == val {
                    j -= 1
                } else {
                    (nums[i], nums[j]) = (nums[j], nums[i])
                    i += 1
                    j -= 1
                }
            }
        }
        return i
    }
}
var numArray: [Int] = [1,1,2,2,1]
Solution().removeElement(&numArray, 1)
