//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/surrounded-regions/


///从外到内遍历
///minx maxX minY MaxY
///记录 不能被围绕的O

class Solution {
    
    func dfs(_ board: inout [[Character]], _ x: Int, _ y: Int) {
        if x < 0 || x > board.count || y < 0 || y > board.first!.count || board[x][y] != "O" {
            return
        }
        board[x][y] = "A"
        dfs(&board, x+1, y)
        dfs(&board, x-1, y)
        dfs(&board, x, y+1)
        dfs(&board, x, y-1)
    }
    func solve(_ board: inout [[Character]]) {
        if board.count <= 0 { return }
        for i in 0..<board.count {
            dfs(&board, i, 0)
            dfs(&board, i, board.first!.count-1)
        }
        
        for i in 1..<board.first!.count {
            dfs(&board, 0, i)
            dfs(&board, board.count-1, i)
        }
        
    }
}
