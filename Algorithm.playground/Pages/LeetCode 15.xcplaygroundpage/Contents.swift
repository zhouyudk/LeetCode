//: [Previous](@previous)

import Foundation

/*15. 三数之和
给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。

注意：答案中不可以包含重复的三元组。



示例：

给定数组 nums = [-1, 0, 1, 2, -1, -4]，

满足要求的三元组集合为：
[
  [-1, 0, 1],
  [-1, -1, 2]
]
 */

class Solution {
    ///对于较短的nums适用，由于3层for 时间复杂为n的3次方，对于长数组及其耗时
    func threeSum1(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        var result = [[Int]:Int]()
        for i in 0..<nums.count-2 {
            for j in i+1..<nums.count-1 {
                for k in j+1..<nums.count{
                    if nums[i] + nums[j] + nums[k] == 0 {
                        result[[nums[i], nums[j], nums[k]].sorted()] = 0
                    }
                }
            }
        }
        return Array(result.keys)
    }

    //转hash ,使用双指针  单层循环
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        var result: Set<[Int]> = []
        var hash = [Int:Int]()
        for n in nums {
            if let h = hash[n] {
                hash[n] = h+1
            } else {
                hash[n] = 1
            }
        }
        //如果三个0
        if let k = hash[0] {
            if k >= 3 {
                result.insert([0,0,0])
            }
            hash[0] = 1
        }
        let hashKeys = hash.keys.sorted()
        var left = 0
        var right = hashKeys.count-1
        var target: Int
        while left<right {
            target = 0 - hashKeys[left] - hashKeys[right]
            if hash[hashKeys[left]]! > 1 {
                if hash[0-hashKeys[left]*2] != nil {
                    result.insert([hashKeys[left],hashKeys[left],0-hashKeys[left]*2].sorted())
                }
            }
            if hash[hashKeys[right]]! > 1 {
               if hash[0-hashKeys[right]*2] != nil {
                   result.insert([0-hashKeys[right]*2,hashKeys[right],hashKeys[right]].sorted())
                }
            }

            if target != hashKeys[left] && target != hashKeys[right] && hash[target] != nil {
                result.insert([hashKeys[left],target,hashKeys[right]].sorted())
            }

            if target > 0 {
                left += 1
            } else {
                right -= 1
            }
        }
        return Array(result)
    }
}
let dddd = [-4,-2,-2,-2,0,0,1,2,2,2,3,3,4,4,6,6]//[-1, 0, 1, 2, -1, -4, 3, 5]//[1,1,-2]//[-1, 0, 1, 2, -1, -4, 3, 2, 5]
print(Solution().threeSum(dddd))
print(dddd.count*dddd.count)

//let aaaa=[111:222]
//print(aaaa[112])
