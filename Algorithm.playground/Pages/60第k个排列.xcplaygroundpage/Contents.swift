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
        var nn = n
        var k = k
        var res = ""
        while nn>2 {
            let r = k/(nn-1)
            k = k%nn
            print(r ,k , nn, arr)
            res += "\(arr[r-1])"
            arr.remove(at: r-1)
            nn -= 1
        }
        return res
    }
}

Solution().getPermutation(3,2)

