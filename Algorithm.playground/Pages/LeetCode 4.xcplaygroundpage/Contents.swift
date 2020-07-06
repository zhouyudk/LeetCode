//: [Previous](@previous)

import Foundation
/*
 4. 寻找两个正序数组的中位数
 
 给定两个大小为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。
 
 请你找出这两个正序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
 
 你可以假设 nums1 和 nums2 不会同时为空。
 
   
 
 示例 1:
 
 nums1 = [1, 3]
 nums2 = [2]
 
 则中位数是 2.0
 示例 2:
 
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 则中位数是 (2 + 3)/2 = 2.5
 */

/*思路
   首先直接通过nums1和nums2的count总数计算出目标index（对于总数为偶数的情况以较大的一个index作为目标），然后将count小的数组中的元素依次插入到长数组，如果插入index大于等于目标index则找到目标值，直接return
    最坏的情况为 两个数组完全合并才找到！！！
 */
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    guard nums1.count > 0 || nums2.count > 0 else { return 0 }
    //比较nums1和2的长度 ，短的插入到长的数组
    var (longNums, shortNums) = nums1.count >= nums2.count ? (nums1,nums2) : (nums2,nums1)
    var left = 0
    var right = longNums.count-1
    var mid: Int = longNums.count/2
    let totalCount = longNums.count + shortNums.count

    let targetIndex = totalCount/2

    for num in shortNums {
        while left<right {
            if num == longNums[mid] {
                break
            } else if num > longNums[mid] {
                left = mid+1
                mid = (left+right)/2
            } else {
                right = mid-1
                mid = (left+right)/2
            }
        }

        let insertIndex = num >= longNums[mid] ? mid+1 : mid
        longNums.insert(num, at: insertIndex)
        if targetIndex <= insertIndex {
            if totalCount%2 == 1 {
                return Double(longNums[targetIndex])
            } else {
                return Double(longNums[targetIndex]+longNums[targetIndex-1])/2
            }

        }
        left = insertIndex+1
        right = longNums.count-1
        mid = (left+right)/2
    }
    //针对其中一个数组为空，和for循环结束也没有targetIndex <= insertIndex的情况
    if totalCount%2 == 1 {
          return Double(longNums[targetIndex])
      } else {
          return Double(longNums[targetIndex]+longNums[targetIndex-1])/2
      }
}

findMedianSortedArrays([], [2,3])

/*参考
 https://leetcode-cn.com/problems/median-of-two-sorted-arrays/solution/shuang-zhi-zhen-by-powcai/
 */
