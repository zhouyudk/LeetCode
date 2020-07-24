//: [Previous](@previous)
//https://leetcode-cn.com/problems/swap-nodes-in-pairs/
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
    
    init(nodeCount: Int, multiple: Int) {
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
    //递归O(n) 空间O(n)
    func swapPairs1(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        if head!.next == nil { return head }
        let node = head!.next
        head!.next = swapPairs(node!.next)
        node!.next = head
        return node
    }
    //迭代
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var h = head
        let dump = ListNode(-1)
        dump.next = head
        var dumpT = dump
        var tmp: ListNode?
        while h != nil && h!.next != nil {
            let first = h
            let second = h!.next
            dumpT.next = second!
            first!.next = second!.next
            second!.next = first
            
            dumpT = first!
            h = first!.next
        }
        return dump.next
    }
    
}

let l1 = ListNode(nodeCount: 5, multiple: 1)
Solution().swapPairs(l1)!.printNode()
