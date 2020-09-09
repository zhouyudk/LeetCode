//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/spiral-matrix-ii/

class Solution {
    var count = 0
    func generateMatrix(_ n: Int) -> [[Int]] {
        guard n > 0 else { return []}
        count = n*n
        var res = [[Int]](repeating: [Int](repeating: 0,count: n), count: n)
        helper(&res, minH: 0, minW: 0, maxH: n-1, maxW: n-1, index: 1)
        return res
    }
    
    func helper(_ res: inout [[Int]], minH: Int, minW: Int, maxH: Int, maxW: Int, index: Int) {
        if index>count {
            return
        }
        var index = index
        for i in minW...maxW {
            res[minH][i] = index
            index += 1
        }
        if index>count {
            return
        }
        for i in (minH+1)...maxH {
            res[i][maxW] = index
            index += 1
        }
        
        var j = maxW-1
        while j>=minW {
            res[maxH][j] = index
            index += 1
            j -= 1
        }
        
        var k = maxH-1
        while k >= minH+1 {
            res[k][minW] = index
            index += 1
            k -= 1
        }
        print(res)
        helper(&res, minH: minH+1, minW: minW+1, maxH: maxH-1, maxW: maxW-1, index: index)
    }
    
//    func generateMatrix(_ n: Int) -> [[Int]] {
//        guard n > 0 else { return []}
//        var minH = 0
//        var minW = 0
//        var maxH = n
//        var maxW =
//        for i in 1...n*n {
//
//        }
//        var res = [[Int]](repeating: [Int](repeating: 0,count: n), count: n)
//        helper(&res, minH: 0, minW: 0, maxH: n-1, maxW: n-1, index: 1)
//        return res
//    }
}

Solution().generateMatrix(3)
