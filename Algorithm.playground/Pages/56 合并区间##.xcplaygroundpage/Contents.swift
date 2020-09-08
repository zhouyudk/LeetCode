//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/merge-intervals/

class Solution {
    //暴力法  直接排序 (最优解)
    //排序是最快的前提， 细节优化  可以提升执行效率  排序后可以 踢出多于的比较
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count>1 else { return intervals}
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        var res = [intervals.first!]
        for i in 1..<intervals.count {
            if intervals[i][0]>res[res.count-1][1] {
                res.append(intervals[i])
            } else {
                res[res.count-1][1] = max(intervals[i][1], res[res.count-1][1])
            }
            print(res)
        }
        return res
    }
}

let dd = [[1,4],[1,5]]

Solution().merge(dd)

