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
        var nn = n-1
        var k = k
        var res = ""

        var total = 1
        for i in 1..<n {
            total *= i
        }

        while nn>0 {
            if k <= total {
                res += "\(arr[0])"
                arr.remove(at: 0)
                total = total/nn
            } else {
                let r = (k-1)/total
                k = (k-1)%total
                print(r ,k ,total, arr)
                res += "\(arr[r])"
                arr.remove(at: r)
                total = total/nn
            }

            nn -= 1
        }
        return res
    }

}

Solution().getPermutation(3,2)

