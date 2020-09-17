//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/permutation-sequence/

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        if n < 1 { return "" }
        if n == 1 { return "1" }
        if k/(n-1) > n { return "" }
        var arr = [Int]()
        for i in 1...n {
            arr.append(i)
        }
        var kMap = [Int: Int]()
        var nn = n
        var k = k
        var res = ""
        while nn>0 {
            var r = k/nn
            k = k%nn
            print(r , arr)
            res += "\(arr[r])"
            arr.remove(at: r)
            nn -= 1
        }
//        res += "\(arr.first!)"
        return res
    }
}

Solution().getPermutation(4,4)

