//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/rotate-list/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init() {
        self.val = 0; self.next = nil;
    }

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val; self.next = next;
    }

    public func printNode() {
        print(val)
        next?.printNode()
    }

    static func initListNode(_ count: Int, _ multiple: Int) -> ListNode {
        let root = ListNode(0)
        var tmp = root
        for i in 0..<count {
            tmp.next = ListNode(i*multiple)
            tmp = tmp.next!
        }
        return root.next!
    }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else { return head }
        var nodeArray = [ListNode]()
        var tmp = head
        while tmp != nil {
            nodeArray.append(tmp!)
            tmp = tmp?.next
        }
        let k = k%nodeArray.count
        if k == 0 {
            return head
        } else {
            nodeArray[nodeArray.count-1-k].next = nil
            nodeArray[nodeArray.count-1].next = head
            return nodeArray[nodeArray.count-k]
        }
    }
}

Solution().rotateRight(ListNode.initListNode(10, 1), 0)?.printNode()
