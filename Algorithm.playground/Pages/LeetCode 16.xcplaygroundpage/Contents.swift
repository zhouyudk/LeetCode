//: [Previous](@previous)

import Foundation

/*16. 最接近的三数之和
 难度
 中等
 
 509
 
 收藏
 
 分享
 切换为英文
 关注
 反馈
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 
 
 
 示例：
 
 输入：nums = [-1,2,1,-4], target = 1
 输出：2
 解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
 
 
 提示：
 
 3 <= nums.length <= 10^3
 -10^3 <= nums[i] <= 10^3
 -10^4 <= target <= 10^4
 */
class Solution {
    //暴力法, 解法正确 但超时
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var r: Int!
        let numsSorted = nums.sorted()
        for i in 0..<numsSorted.count-2 {
            if i-1 >= 0 && numsSorted[i] == numsSorted[i-1] {
                continue
            }
            for j in i+1..<numsSorted.count-1 {
                if j-1 > i && numsSorted[j] == numsSorted[j-1] {
                    continue
                }
                var diff: Int!
                for k in j+1..<numsSorted.count {
                    print(i, j ,k)
                    if k-1 > j && numsSorted[k] == numsSorted[k-1] {
                        continue
                    }
                    if numsSorted[i] + numsSorted[j] + numsSorted[k] == target {
                        return numsSorted[i] + numsSorted[j] + numsSorted[k]
                    } else {
                        if diff != nil && abs(numsSorted[i]+numsSorted[j]+numsSorted[k]-target) >= diff {
                            break
                        } else {
                            if r != nil && abs(numsSorted[i]+numsSorted[j]+numsSorted[k]-target) < abs(r-target) {
                                r = (numsSorted[i]+numsSorted[j]+numsSorted[k])
                            } else if r == nil {
                                r = (numsSorted[i]+numsSorted[j]+numsSorted[k])
                            }
                            diff = abs(numsSorted[i]+numsSorted[j]+numsSorted[k]-target)
                        }
                    }
                }
            }
        }
        return r ?? 0
    }
    //双层循环 双指针 参照题15 满足时间要求
    func threeSumClosest1(_ nums: [Int], _ target: Int) -> Int {
        var r: Int!
        let numsSorted = nums.sorted()
        for i in 0..<numsSorted.count-2 {
            if i-1 >= 0 && numsSorted[i] == numsSorted[i-1] {
                continue
            }
            let sub = target-numsSorted[i]
            var left = i+1
            var right = numsSorted.count-1
//            var diff = abs(numsSorted[left]+numsSorted[right]-sub)
            while left<right {
                if numsSorted[left]+numsSorted[right] == sub {
                    return sub+numsSorted[i]
                } else {
//                    print(abs(numsSorted[left]+numsSorted[right]-sub),diff,"dddd")
                    if r == nil {
                        r = (numsSorted[i]+numsSorted[left]+numsSorted[right])
                    }
                    if abs(numsSorted[left]+numsSorted[right]-sub) <= abs(r-target) {
                        r = (numsSorted[i]+numsSorted[left]+numsSorted[right])
//                        diff = abs(numsSorted[left]+numsSorted[right]-sub)
                    }
                    if numsSorted[left]+numsSorted[right] < sub {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }
        return r ?? 0
    }
}
let dd = [47,-48,-72,97,-78,50,-22,18,9,24,28,-53,44,-96,50,45,86,11,21,-44,67,83,55,-86,-33,0,-53,-94,-60,57,-72,-73,-27,13,91,80,18,-80,-29,-69,-74,-90,54,22,3,91,-47,-32,80,-55,69,-95,62,-92,4,-86,62,3,23,-30,-4,0,49,24,10,-32,79,-99,-66,-30,-83,-13,90,-27,9,-4,9,98,-70,-19,32,24,-77,83,11,-78,-94,4,41,61,20,96,-36,54,-46,-51,91,54,30,-42,82,0,9,24,-2,32,-16,-18,87,23,78,-10,-82,-67,68,-18,-61,91,-90,-53,67,-48,12,1,-71,-99,31,82,39,-56,23,-89,-58,19,-60,39,-23,-76,-85,67,-33,69,-74,-8,-99,52,-70,-71,85,-8,28,-3,-100,18,88,5,-16,17,91,-35,22,-76]
//[-1,2,1,-4]
Solution().threeSumClosest1([1,1,1,0],-100)
