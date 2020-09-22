//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/combinations/

class Solution {
    var res = [[Int]]()
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard n>=k else { return [] }
        for i in 1...n {
            helper([i],i+1,n,k)
            //剪枝
            if n-i<k {
                return res
            }
        }
        return res

    }

    func helper(_ arr: [Int], _ i: Int, _ n: Int, _ k: Int) {
        var r = arr
        if r.count == k {
            res.append(r)
            return
        }
        if i>n {
            return
        }
        for j in i...n {
            //剪枝
            if n-j+1<k-r.count {
                return
            }
            r.append(j)
            helper(r, j+1, n,k)
            r.removeLast()
        }

    }
}

Solution().combine(4,2)
