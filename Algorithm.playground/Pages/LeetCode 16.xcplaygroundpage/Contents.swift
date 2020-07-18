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
}

Solution().threeSumClosest([1,1,1,0],-100)
