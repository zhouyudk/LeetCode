//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/insert-interval/

class Solution {
    // 和合并区间的思路相同  只是多出了  新区间是否插入的判断  以及 与低区间 重叠情况  如[[1,5]]  插入[4,6]
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count>0 else { return [newInterval] }
        var res = [[Int]]()
        var newInterval = newInterval
        var isInserted = false
        for i in 0..<intervals.count {
            if intervals[i][1] < newInterval[0] {
                res.append(intervals[i])
            } else if intervals[i][0]>newInterval[1] {// 如果所有的区间都比插入的区间上限小 则不会进入此处
                res.append(newInterval)
                isInserted = true
                res += intervals[intervals.index(intervals.endIndex, offsetBy: i-intervals.count)..<intervals.endIndex]
                break
            } else {
                newInterval[1] = max(intervals[i][1], newInterval[1])
                newInterval[0] = min(intervals[i][0], newInterval[0])
            }
//            print(res, newInterval)
        }
        if !isInserted {
            res.append(newInterval)
        }
        return res
    }
}

let dd = [[1,3]]
let n = [4,5]

Solution().insert(dd, n)
