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
 和midIndex的值比较 如果小与 则判断midIndex-1与值的大小
 */
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    guard nums1.count > 0 && nums2.count > 0 else { return 0 }
    //其中一个为空时
    if nums1.count == 0 || nums2.count == 0 {
        let nums = nums1+nums2
        let count = nums.count
        if count%2 == 1 {
            return nums[(count-1)/2]
        } else {
            return (nums[count/2-1]+nums[count/2])/2
        }
    }
    
    if nums1.count == 1 && nums2.count == 1 {
        return (nums1[0]+nums2[0])/2
    }
    //比较nums1和2的长度 ，短的插入到长的数组
    var (longNums, shortNums) = nums1.count >= nums2.count ? (nums1,nums2) : (nums2,nums1)
    var lastIndex: Int = longNums.count/2
    var minIndex = 0
    var maxIndex = longNums.count-1
    let totalCount = longNums.count + shortNums.count
    if totalCount%2 == 1 {
        var targetIndex = totalCount/2
        
    } else {
        var targetIndex1 = totalCount/2 -1
        var targetIndex2 = totalCount/2
    }
    for num in shortNums {
        
        if num == longNums[lastIndex] {
            longNums.insert(num, at: lastIndex+1)
            minIndex = lastIndex+1
            if minIndex < maxIndex {
                continue
            } else {
                
            }
            
        } else {
            
        }
        if max - min < 2 {
            
        }
    }
    return 0
}
[1,4,6,8,9,11]
[2,4,5,7,8]

[1,4]
[2]
