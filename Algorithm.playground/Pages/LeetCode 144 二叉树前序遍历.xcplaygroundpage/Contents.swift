//: [Previous](@previous)

import Foundation

/*144. 二叉树的前序遍历
给定一个二叉树，返回它的 前序 遍历。

 示例:

输入: [1,null,2,3]
   1
    \
     2
    /
   3

输出: [1,2,3]
进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func initTree(_ count: Int) -> TreeNode? {
    var nodeList = [TreeNode]()
    for i in 0..<count {
        nodeList.append(TreeNode(i))
    }
    var j = 0
    var i = 1
    while i<count {
        let node = nodeList[j]
        node.left = nodeList[i]
        if i+1<count {
            node.right = nodeList[i+1]
        }
        i += 2
        j += 1
    }
    return nodeList.first
}

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var result = [Int]()
        var nodeList = [TreeNode]()
        nodeList.append(root!)
        while nodeList.count != 0 {
            let node = nodeList.last!
            nodeList.removeLast()
            result.append(node.val)
            if node.right != nil {
                nodeList.append(node.right!)
            }
            if node.left != nil {
                nodeList.append(node.left!)
            }
        }
        return result
    }
}

let tree = initTree(10)
Solution().preorderTraversal(tree)
