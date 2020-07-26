//: [Previous](@previous)

//https://leetcode-cn.com/problems/merge-k-sorted-lists/
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
        for i in 0..<nodeCount {
            tmp.next = ListNode(i*multiple)
            tmp = tmp.next!
        }
        next = n.next
        printNode()
        print("---------------分割线-----------------")
    }
}

///loop + 递归 + 排序
// 1 排序 然后取出最小的node 移动后 又排序

class Solution {
    //暴力法 直接筛选排序  超时 O(k^n)
    func mergeKLists1(_ lists: [ListNode?]) -> ListNode? {
        var nLists = lists.filter({ $0 != nil })
        if nLists.count == 0 { return nil }

        nLists = nLists.sorted(by: { $0!.val < $1!.val})
        let node = nLists.first!
        nLists[0] = node?.next
        node?.next = mergeKLists(nLists)

        return node
    }
    //降低时间复杂度  分治合并 O(nlog(k))n 为最大链表长度  k为链表个数
    //复杂的问题可以分解为 若干个简单的问题
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 { return nil }
        return mergeHelper(lists, 0 , lists.count-1)
    }
    func mergeHelper(_ lists:[ListNode?], _ l: Int, _ r: Int) -> ListNode? {
        if l > r { return nil }
        if l == r { return  lists[l] }
        let mid = (r+l) >> 1
        print("--------", mid)
        return mergeTwoLists(mergeHelper(lists,l,mid), mergeHelper(lists,mid+1,r))
    }

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

let l1 = ListNode(nodeCount: 5, multiple: 2)
let l2 = ListNode(nodeCount: 5, multiple: 3)
let l3 = ListNode(nodeCount: 5, multiple: 4)

Solution().mergeKLists([l1,l2,l3])?.printNode()
