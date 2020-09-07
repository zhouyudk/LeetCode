//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/merge-intervals/

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count>1 else { return intervals}
        var res = [intervals.first!]
        var range = intervals.first!
        for i in 1..<intervals.count {
            var r = intervals[i]
            print(r)
            if range[1]<r[0] || range[0]>r[1] { //[1,3]  [4,6]
                res.append(r)
            } else if range[1] > r[1] && range[0] < r[0] { //[1,4] [2,3]
                continue
            } else if range[0]>=r[0] && range[1] >= r[1] {// [1,4] [0,3]
                range[0] = r[0]
                res[0] = range
            } else if range[0]<=r[0] && range[1] <= r[1] { // [1, 4] [2,5]
                range[1] = r[1]
                res[0] = range
            } else if range[1] < r[1] && range[0] > r[0] { // [1,4] [0,5]
                range = r
                res[0] = range
            }
        }
        print(res)
        //结束标识
        if res.count == intervals.count {
            return intervals
        } else {
            return merge(res)
        }
    }
}

let dd = [[1,4],[1,5]]

Solution().merge(dd)

