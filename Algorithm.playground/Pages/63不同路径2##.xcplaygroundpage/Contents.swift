//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/unique-paths-ii/
//击败100%
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.count > 0 && obstacleGrid.first!.count > 0 else { return 0 }
        let m = obstacleGrid.count
        let n = obstacleGrid.first!.count
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var tmpM = m - 1
        while tmpM >= 0  {
            var tmpN = n-1
            while tmpN >= 0 {
                if obstacleGrid[tmpM][tmpN] == 1 {
                    //如果障碍物在终点 则直接返回0
                    if tmpM == m - 1 && tmpN == n-1 {
                        return 0
                    }
                    res[tmpM][tmpN] = 0
                } else {
                    if tmpM == m-1 && tmpN == n-1 {
                        res[tmpM][tmpN] = 1
                    } else if tmpM == m-1 {
                        res[tmpM][tmpN] = res[tmpM][tmpN+1]
                    } else if tmpN == n-1 {
                        res[tmpM][tmpN] = res[tmpM+1][tmpN]
                    }else {
                        res[tmpM][tmpN] = res[tmpM+1][tmpN] + res[tmpM][tmpN+1]
                    }
                }
                tmpN -= 1
            }
            tmpM -= 1
        }
        return res[0][0]
    }
}

let dd = [
  [0,1]
]

Solution().uniquePathsWithObstacles(dd)
