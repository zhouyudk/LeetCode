//: [Previous](@previous)
//https://leetcode-cn.com/problems/reverse-nodes-in-k-group/
import Foundation

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
    
    init(nodeCount: Int, multiple: Int = 1) {
        val = 0
        let n = ListNode(0)
        var tmp = n
        for i in 1..<nodeCount {
            tmp.next = ListNode(i*multiple)
            tmp = tmp.next!
        }
        next = n.next
        printNode()
        print("---------------分割线-----------------")
    }
}

class Solution {
    //要求空间复杂度为O(1) 递归的空间为O() 所以使用迭代
    // 不能使用数组
    // 如果处理当剩余的节点数少于k时
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k <= 1 { return head }
        let dump = ListNode(-1)
        var dumpPre = dump
        var h = head
        dumpPre.next = h
        var count = 0
        while h != nil {
            var kLast = h //用于传递每一组的最后一个
            h = h!.next
            count += 1
//            print(count,"count countcount",h)
            if count == k {
                var kF = dumpPre.next
                kLast?.next = nil//截断
                dumpPre.next = reverseListNode(dumpPre.next)//翻转
                kF!.next = h//拼接
                dumpPre = kF!
                count = 0
            }
        }
        return dump.next
    }
    
    //翻转链表
    func reverseListNode(_ head: ListNode?) -> ListNode? {
        var h = head
        var pre: ListNode?
        while h != nil && h?.next != nil {
            var next = h?.next
            h!.next = pre
            pre = h!
            h = next!
        }
        if h == nil {
            return pre
        } else {
            h?.next = pre!
            return h
        }
    }
}

let l1 = ListNode(nodeCount: 2)
//Solution().reverseListNode(l1).0?.printNode()
print("-=-=-=-=-=-=-=-=-=-=")
Solution().reverseKGroup(l1, 2)?.printNode()
