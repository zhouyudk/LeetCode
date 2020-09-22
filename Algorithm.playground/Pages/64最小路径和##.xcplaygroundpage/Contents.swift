//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/minimum-path-sum/

class Solution {
    //直接递归
    var res = Int.max
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 && grid.first!.count > 0 else { return 0 }
        helper(grid, 0, 0, 0)
        return res
    }

    func helper(_ grid: [[Int]], _ m: Int, _ n: Int, _ r: Int) {
        print(m , n , r)
        if m == grid.count-1 && n == grid.first!.count-1 {
            res = min(res, r+grid[m][n])
            return
        } else if m == grid.count-1 {
            helper(grid, m, n+1, r+grid[m][n])
        } else if n == grid.first!.count-1 {
            helper(grid, m+1, n, r+grid[m][n])
        } else {
            helper(grid, m+1, n, r+grid[m][n])
            helper(grid, m, n+1, r+grid[m][n])
        }
    }

    //动态规划
    func minPathSum2(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 && grid.first!.count > 0 else { return 0 }
        let m = grid.count
        let n = grid.first!.count
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var tmpM = m-1
        while tmpM >= 0  {
            var tmpN = n-1
            while tmpN >= 0 {
                if tmpM == m-1 && tmpN == n-1 {
                    res[tmpM][tmpN] = grid[tmpM][tmpN]
                } else if tmpM == m-1 {
                    res[tmpM][tmpN] = grid[tmpM][tmpN]+res[tmpM][tmpN+1]
                } else if tmpN == n-1 {
                    res[tmpM][tmpN] = grid[tmpM][tmpN]+res[tmpM+1][tmpN]
                }else {
                    res[tmpM][tmpN] = min(grid[tmpM][tmpN]+res[tmpM+1][tmpN], grid[tmpM][tmpN]+res[tmpM][tmpN+1])
                }
                tmpN -= 1
            }
            tmpM -= 1
        }
        return res[0][0]
    }
}

let dd = [
  [1,3,1],
  [1,5,1],
  [4,2,1]
]

Solution().minPathSum2(dd)
