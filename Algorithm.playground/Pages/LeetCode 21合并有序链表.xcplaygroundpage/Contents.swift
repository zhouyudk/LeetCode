//: [Previous](@previous)

import Foundation

/*
 21. 合并两个有序链表
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。



 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        if l1!.val <= l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
}

let l1 = ListNode.initListNode(5,2)
let l2 = ListNode.initListNode(5,3)
l1.printNode()
print("--------------")
l2.printNode()
print("--------------")
Solution().mergeTwoLists(l1, l2)?.printNode()
