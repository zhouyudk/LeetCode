//: [Previous](@previous)

import Foundation
//https://leetcode-cn.com/problems/substring-with-concatenation-of-all-words/
/*
 30. 串联所有单词的子串
 难度
 困难

 给定一个字符串 s 和一些长度相同的单词 words。找出 s 中恰好可以由 words 中所有单词串联形成的子串的起始位置。
 
 注意子串要与 words 中的单词完全匹配，中间不能有其他字符，但不需要考虑 words 中单词串联的顺序。
 
 
 
 示例 1：
 
 输入：
 s = "barfoothefoobarman",
 words = ["foo","bar"]
 输出：[0,9]
 解释：
 从索引 0 和 9 开始的子串分别是 "barfoo" 和 "foobar" 。
 输出的顺序不重要, [9,0] 也是有效答案。
 示例 2：
 
 输入：
 s = "wordgoodgoodgoodbestword",
 words = ["word","good","best","word"]
 输出：[]
 */
//将words拼接出来再去查询,O(n) 排列
//words作 hash
//特例 ab ba ab 作为word的话 work中的字母 前后交叉 如何处理
class Solution {
    //外层循环其实可以遍历words中一个单词的长度  然后内层循环按单词长度遍历
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard words.count > 0 else { return [] }
        var hash = [String: Int]()
        
        var r = [Int]()
        //生成hash
        for w in words {
            if hash[w] == nil {
                hash[w] = 1
            } else {
                hash[w]! += 1
            }
        }
        
        //记录hash
        let c = words.first!.count
        var record = hash
        var i = 0
        var rArr = [String]()
        var j = 0
        while i < s.count-c {
            //            if s.count-i < words.count*c {
            //                break
            //            }
            let subS = String(s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i+c)])
            print(subS)
            print(record,rArr.count-j,words.count)
            if record[subS] != nil {
                if rArr.count-j >= words.count {
                    if subS == rArr[j] {
                        r.append(i-(words.count-1)*c)
                        rArr.append(subS)
                        i += c
                        j += 1
                    } else {
                        while j < rArr.count {
                            if subS != rArr[j] {
                                j += 1
                            } else {
                                rArr.append(subS)
                                j += 1
                                break
                            }
                        }
                        if j < rArr.count {
                            record = hash
                            while j < rArr.count {
                                if record[rArr[j]]! - 1 == 0 {
                                    record.removeValue(forKey: rArr[j])
                                } else {
                                    record[subS]! -= 1
                                }
                                j += 1
                            }
                            i += c
                        } else {
                            i += 1
                            record = hash
                        }
                    }
                } else {
                    if record[subS]! - 1 == 0 {
                        record.removeValue(forKey: subS)
                    } else {
                        record[subS]! -= 1
                    }
                    if record.count == 0 {
                        r.append(i-(words.count-1)*c)
                        record = hash
                    }
                    i += c
                }
                rArr.append(subS)
            } else {
                i += 1
            }
            //            print(subS)
        }
        return r
    }
    //超时 O(n*n)
    func findSubstring1(_ s: String, _ words: [String]) -> [Int] {
        guard words.count > 0 else { return [] }
        let wordsLen = words.count*words.first!.count
        guard s.count>=wordsLen else { return [] }
        var r = [Int]()
        for i in 0...s.count-wordsLen {
            let subS = String(s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i+wordsLen)])
            if isSubstring(subS, words) {
                r.append(i)
            }
        }
        return r
    }
    func isSubstring(_ s: String, _ words: [String]) -> Bool {
        var hash = [String: Int]()
        //生成hash
        for w in words {
            if hash[w] == nil {
                hash[w] = 1
            } else {
                hash[w]! += 1
            }
        }
        
        //记录hash
        let c = words.first!.count
        
        var i = 0
        print(s, hash)
        while i < s.count {
            let subS = String(s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i+c)])
//            print(subS)
            if hash[subS] == nil {
                return false
            } else {
                if hash[subS]!-1 == 0 {
                    hash.removeValue(forKey: subS)
                } else {
                    hash[subS]! -= 1
                }
            }
            i += c
        }
        print(hash)
        return hash.count == 0
    }
}

//"wordgoodgoodgoodbestword"
//["word","good","best","good"]
Solution().findSubstring1("", ["word","good","best","good"])
