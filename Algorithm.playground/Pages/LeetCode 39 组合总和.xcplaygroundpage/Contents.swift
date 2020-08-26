//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/combination-sum/

class Solution {
    var cache = [Int:[[Int]]]()
    var sortNums = [Int]()
    var hashNums = [Int: Int]()
    var result = [[Int]]()
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        sortNums = candidates.sorted()
        for n in sortNums {
            hashNums[n] = 0
        }
        helper0(target, [target])
    }
    
    func helper0(_ target: Int, _ nums: [Int]) {
        for
    }
    
    func helper(_ target: Int, nums: [Int]) {
        var tmp = [Int:[[Int]]]()
        var lastHashKey = sortNums.first!
        var lastNum: Int
        for n in sortNums {
            if lastNum == n {
                continue
            }
            lastNum = n
            var r = [[Int]]()
            if let c = cache[n] {
                r = c
            } else {
                let x = target - n
                if x <= lastHashKey {
                    break
                } else {
                    if let y = hashNums[x] {
                        r = [n, x]
                    }
                }
            }
            var numsCopy = nums
            nums.remove(n)
            
        }
        
        return [[Int]]()
    }
}
