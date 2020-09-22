//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/unique-paths/

class Solution {
    // 常规递归 超时
    var count = 0
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        helper(m,n,1,1)
        return count
    }

    func helper(_ m: Int, _ n: Int, _ cm: Int, _ cn: Int) {
//        print(cm,cn)
        if m == cm && n == cn {
            count += 1
            return
        }
        if cm+1 <= m {
            helper(m,n,cm+1,cn)
        }

        if cn+1 <= n {
            helper(m,n,cm,cn+1)
        }

    }

    //优化时间 从1 1 开始计算
    func uniquePaths2(_ m: Int, _ n: Int) -> Int {
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var tmpM = m-1
        while tmpM >= 0  {
            var tmpN = n-1
            while tmpN >= 0 {
                if tmpM == m-1 || tmpN == n-1 {
                    res[tmpM][tmpN] = 1
                } else {
                    res[tmpM][tmpN] = res[tmpM+1][tmpN] + res[tmpM][tmpN+1]
                }
                tmpN -= 1
            }
            tmpM -= 1
        }
        return res[0][0]
    }

}

Solution().uniquePaths2(7,3)
