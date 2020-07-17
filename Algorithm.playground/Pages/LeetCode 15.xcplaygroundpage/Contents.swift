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
    //    func threeSum1(_ nums: [Int]) -> [[Int]] {
    //        guard nums.count >= 3 else { return [] }
    //        var result = [[Int]:Int]()
    //        for i in 0..<nums.count-2 {
    //            for j in i+1..<nums.count-1 {
    //                for k in j+1..<nums.count{
    //                    if nums[i] + nums[j] + nums[k] == 0 {
    //                        result[[nums[i], nums[j], nums[k]].sorted()] = 0
    //                    }
    //                }
    //            }
    //        }
    //        return Array(result.keys)
    //    }
    
    //转hash  双层循环
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        var result: [[Int]] = []
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
                result.append([0,0,0])
            }
            hash[0] = 1
        }
        let numsSorted = nums.sorted()
        for i in 0..<numsSorted.count-1{
            if numsSorted[i] >= 0 {
                break
            }
            if i-1 >= 0 && numsSorted[i] == numsSorted[i-1] {
                continue
            }
            for j in i+1..<numsSorted.count {
                if 0-numsSorted[i]-numsSorted[j] < numsSorted[j] {
                    break
                }
                if j-1 > i && numsSorted[j] == numsSorted[j-1] {
                    continue
                }
                if 0-numsSorted[i]-numsSorted[j] == numsSorted[j] {
                    if hash[numsSorted[j]]! > 1 {
                        result.append([numsSorted[i],numsSorted[j],numsSorted[j]])
                        print([numsSorted[i],numsSorted[j],numsSorted[j]])
                        continue
                    }
                } else {
                    if hash[0-numsSorted[i]-numsSorted[j]] != nil {
                        result.append([numsSorted[i],numsSorted[j],0-numsSorted[i]-numsSorted[j]])
                    }
                }
            }
        }
        return Array(result)
    }
}
// let dddd = [-4,-2,-2,-2,0,0,1,2,2,2,3,3,4,4,6,6]//[-1, 0, 1, 2, -1, -4, 3, 5]//[1,1,-2]//[-1, 0, 1, 2, -1, -4, 3, 2, 5]
// -4 -1 -1 0 1 2
//[-1, 0, 1, 2, -1, -4]
 Solution().threeSum([-1, 0, 1, 2, -1, -4])


//使用双指针法 待测

