//: [Previous](@previous)

import Foundation

//https://leetcode-cn.com/problems/valid-anagram/

class Solution {
    // 直接排序比较 O(nlogn)
    func isAnagram1(_ s: String, _ t: String) -> Bool {
        var sArr = Array(s)
        var tArr = Array(t)
        sArr.sort(by: >)
        tArr.sort(by: >)
        return  String(sArr) == String(tArr)
    }
    //其中一个转hash O(n+k)
    func isAnagram2(_ s: String, _ t: String) -> Bool {
        var sHash = [Character: Int]()
        for c in s {
            if sHash[c] != nil {
                sHash[c] = sHash[c]!+1
            } else {
                sHash[c] = 1
            }
        }

        for c in t {
            if sHash[c] == nil {
                return false
            } else {
                if sHash[c]!-1 == 0 {
                    sHash[c] = nil
                } else {
                    sHash[c] = sHash[c]!-1
                }

            }
        }
        return sHash.keys.count == 0
    }

    //hash优化 但是再swift中由于string按index取值必须先转Array所有比上面方法更耗时
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        var hash = [Character: Int]()
        let sArr = Array(s)
        let tArr = Array(t)
        for i in 0..<sArr.count {
            hash[sArr[i]] = hash[sArr[i]] == nil ? 1 : hash[sArr[i]]!+1
            hash[tArr[i]] = hash[tArr[i]] == nil ? -1 : hash[tArr[i]]!-1
        }

        for v in hash.values {
            if v != 0 {
                return false
            }
        }
        return true
    }
}
Solution().isAnagram("abdc","abcd")
