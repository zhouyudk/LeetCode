//: Playground - noun: a place where people can play

import Foundation
/*
给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

示例：

输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
输出：7 -> 0 -> 8
原因：342 + 465 = 807
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    public func printVal() {
        print(val)
        next?.printVal()
    }
}

extension Int {
    func toListNodes()->ListNode {
        var tmp = self
        let head = ListNode(0)
        var nextNode = head
        while tmp>0 {
            let v = tmp%10
            nextNode.next = ListNode(v)
            nextNode = nextNode.next!
            tmp = tmp/10
        }
        return head.next!
    }
}
//2746.toListNodes().printVal()

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let head = ListNode(0)
    var tmp = head
    var ll1 = l1
    var ll2 = l2
    while ll1 != nil || ll2 != nil {
        let sum = (ll1?.val ?? 0) + (ll2?.val ?? 0) + (tmp.next?.val ?? 0)
        tmp.next = ListNode(sum%10)
        tmp = tmp.next!
        if sum >= 10 {
            tmp.next = ListNode(1)
        }
        ll1 = ll1?.next
        ll2 = ll2?.next
    }
    return head.next
}

addTwoNumbers(8473.toListNodes(), 93756.toListNodes())?.printVal()
