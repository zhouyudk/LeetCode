//: [Previous](@previous)

import Foundation

/*给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 
 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
 
   
 
 示例:
 
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */
//双层循环
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
        let diff = target - nums[i]
        for j in i+1..<nums.count {
            if nums[j] == diff {
                return [i,j]
            }
        }
    }
    return []
}
//hash

func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var hash: [Int: Int] = [:]
    
    for (index, num) in nums.enumerated() {
        if hash[num] != nil {
            if num == target - num {
                return [hash[num]!, index]
            }
            continue
        }
        hash[num] = index
    }
    
    for num in nums {
        let diff = target - num
        if let index = hash[diff] {
            return [hash[num]!, index]
        }
    }
    return []
}


let inArr = [4,4,2,7,11,15]
//print(twoSum(inArr, 9))
//
twoSum2(inArr, 8)

