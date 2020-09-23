//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/permutation-sequence/

// 以每个数开始的个数为n-1的阶乘，以此直接推导
// 当然也可以采用 依次加1的方式 直到加到k
class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        if n < 1 { return "" }
        if n == 1 { return "1" }
        let nf = factorial(n-1)
        if k/(nf) > n || (k/(nf) == n && k%(nf)>0) { return "" }
        var arr = [Int]()
        for i in 1...n {
            arr.append(i)
        }
        var nn = n-1
        var k = k
        var res = ""

        while nn >= 0 {
            if nn == 0 {
                res += "\(arr.last!)"
                break
            }
            let nnf = factorial(nn)
            if k%nnf == 0 {
                res += "\(arr[k/nnf-1])"
                arr.remove(at: k/nnf-1)
                k = nnf
            } else {
                res += "\(arr[k/nnf])"
                arr.remove(at: k/nnf)
                k = k%nnf
            }
            nn -= 1
        }
        return res
    }

    func factorial(_ i: Int) -> Int {
        var r = 1
        for j in 1...i {
            r *= j
        }
        return r
    }
}


Solution().getPermutation(4,5)

