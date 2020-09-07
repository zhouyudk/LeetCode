//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/merge-intervals/

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count>1 else { return intervals}
        var res = [intervals.first!]
        for i in 1..<intervals.count {
            let range = intervals[i]
            for j in 0..<res.count {
                var r = res[j]
                if range[1]+1<r[0] || range[0]-1>r[1] {
                    if j+1 >= res.count {
                        res.append(range)
                    }
                } else if  range[1]+1 == r[0] {
                    r[0] = range[0]
                    res[j] = r
                    break
                } else if range[0]-1 == r[1] {
                    r[1] = range[1]
                    res[j] = r
                    break
                }else if range[0]>=r[0] {
                    if range[1]>r[1] {
                        r[1] = range[1]
                        res[j] = r
                    }
                    break
                } else if range[1]<=r[1] {
                    if range[0]<r[0] {
                        r[0] = range[0]
                        res[j] = r
                    }
                    break
                } else if range[0]<r[0] && range[1]>r[1] {
                    res[j] = range
                    break
                }
            }
            print(res)
        }
        return res
    }
}

let dd = [[2,3],[4,5],[6,7],[8,9],[1,10]]

Solution().merge(dd)
