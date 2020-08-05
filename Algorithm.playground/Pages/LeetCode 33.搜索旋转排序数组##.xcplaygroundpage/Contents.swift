//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/search-in-rotated-sorted-array/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        var l = 0
        var r = nums.count-1
        var m: Int = (r+l)/2
        while l<=r {
            if nums[l] <= nums[r] {
                return binarySearch(l, r, nums, target)
            } else {
                if nums[l] <= nums[m] {
                    if nums[l] <= target && target <= nums[m] {
                        return binarySearch(l, m, nums, target)
                    } else {
                        l = m+1
                        m = (r+l)/2
                    }
                } else if nums[m+1] <= nums[r] {
                    if nums[m+1] <= target && target <= nums[r] {
                        return binarySearch(m+1, r, nums, target)
                    } else {
                        r = m
                        m = (r+l)/2
                    }
                }
            }
        }
        return -1
    }
    
    func binarySearch(_ ll: Int, _ rr: Int, _ nums: [Int],_ target: Int) -> Int {
        var l = ll
        var r = rr
        var m: Int = (r+l)/2
        while l<=r {
            if nums[m] == target {
                return m
            } else if target > nums[m] {
                l = m+1
                m = (r+l)/2
            } else if target < nums[m] {
                r = m-1
                m = (r+l)/2
            }
        }
        return -1
    }
}

Solution().search([4,2,3], 2)
