//: [Previous](@previous)

//https://leetcode-cn.com/problems/validate-binary-search-tree/
import Foundation

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

    static func creatTree(_ count: Int) -> TreeNode? {
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
        inOrder(nodeList.first!)
        return nodeList.first
    }

    //生成二叉搜索树
    static var i = 0
    static func inOrder(_ node: TreeNode?) {
        if node == nil { return }
        inOrder(node!.left)
        node!.val = i
        print(node!.val)
        i += 1
        inOrder(node!.right)
    }
}



class Solution {
    var preVal: Int = Int.min
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        if isValidBST(root?.left) == false {
            return false
        }

        if root!.val <= preVal {
            return false
        }
        preVal = root!.val

        return isValidBST(root!.right)
    }
}

let t = TreeNode.creatTree(10)

Solution().isValidBST(t)
