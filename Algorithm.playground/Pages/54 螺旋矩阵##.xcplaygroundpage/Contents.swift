//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/spiral-matrix/

class Solution {
    //暴力
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0 else { return []}
        guard matrix.first!.count > 0 else { return []}
        return helper(matrix, minH: 0, minW: 0, maxH: matrix.count-1, maxW: matrix.first!.count-1)
    }

    func helper(_ matrix: [[Int]], minH: Int, minW: Int, maxH: Int, maxW: Int) -> [Int] {

        if minH>maxH || minW>maxW {
            return []
        }
        var r = [Int]()
        if minH == maxH {
            for i in minW...maxW {
                r.append(matrix[minH][i])
            }
            return r
        }

        if minW == maxW {
            for i in minH...maxH {
                r.append(matrix[i][maxW])
            }
            return r
        }


        for i in minW...maxW {
            r.append(matrix[minH][i])
        }

        for i in (minH+1)...maxH {
            r.append(matrix[i][maxW])
        }

        var j = maxW-1
        while j>=minW {
            r.append(matrix[maxH][j])
            j -= 1
        }

        var k = maxH-1
        while k >= minH+1 {
            r.append(matrix[k][minW])
                k -= 1
        }
        print(r)
        return r+helper(matrix, minH: minH+1, minW: minW+1, maxH: maxH-1, maxW: maxW-1)
    }
}

let dd = [
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9,10,11,12]
]

Solution().spiralOrder(dd)
