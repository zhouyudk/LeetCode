//: [Previous](@previous)

import Foundation
//https://leetcode-cn.com/problems/merge-sorted-array/


class Solution {
    //反向比较  从大到小 num1从后往前填充O(n)
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard m+n <= nums1.count else { return }
        var m1 = m-1
        var n1 = n-1
        var last = nums1.count-1
        while n1 >= 0 && m1 >= 0 {
            if nums1[m1] >= nums2[n1] {
                nums1[last] = nums1[m1]
                m1 -= 1
                last -= 1
            } else {
                nums1[last] = nums2[n1]
                n1 -= 1
                last -= 1
            }
        }
        while n1 >= 0 {
            nums1[last] = nums2[n1]
            n1 -= 1
            last -= 1
        }
    }
}
var a = [1,2,4,5,7,8,10,0,0,0,0]
var b = [2,6,9,11]
Solution().merge(&a, a.count-4, b, b.count)
print(a)
