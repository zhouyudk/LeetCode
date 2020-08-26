//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/powx-n/
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1}
        guard n != 1 else { return x}
        guard n != -1 else { return 1/x }
        var xx = abs(x)
        var nn = abs(n)
        var tmp = 1.0
        if nn%2 != 0 {
            tmp = x
            nn -= 1
        }
        
        let r = myPow(xx, nn/2)
        print(r, n, n > 0 ? r*r*tmp : 1/(r*r*tmp))
        return n > 0 ? r*r*tmp : 1/(r*r*tmp)
    }
}

Solution().myPow(-2, -3)

//x是否为负数   n是否为负数


