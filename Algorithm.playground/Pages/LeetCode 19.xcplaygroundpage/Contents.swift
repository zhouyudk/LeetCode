//: [Previous](@previous)

import Foundation

/*19. 删除链表的倒数第N个节点
给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

示例：

给定一个链表: 1->2->3->4->5, 和 n = 2.

当删除了倒数第二个节点后，链表变为 1->2->3->5.
说明：

给定的 n 保证是有效的。

进阶：

你能尝试使用一趟扫描实现吗？
 */

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
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public func printNode() {
        print(val)
        next?.printNode()
    }
}
func initListNode(_ i: Int) -> ListNode {
    let root = ListNode(0)
    var tmp = root
    for i in 0..<i {
        tmp.next = ListNode(i)
        tmp = tmp.next!
    }
    return root.next!
}
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return nil }
        var i = 1
        var tmp: ListNode = head!
        //倒数第n+1个
        var tmpN: ListNode?

        while tmp.next != nil {
            if i-1 == n {
                tmpN = head
                tmp = tmp.next!
            } else if i-1 < n {
                tmp = tmp.next!
            } else {
                tmp = tmp.next!
                tmpN = tmpN?.next
            }
             i += 1
        }
        if i == n {
            return head!.next
        } else {
            tmpN?.next = tmpN?.next?.next
            return head
        }
    }
}

let ln = initListNode(10)
ln.printNode()
Solution().removeNthFromEnd(ln,9)?.printNode()
