
import Foundation
/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:
 
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:
 
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
           请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 */

/*
 以字符为key index为value创建hash，记录minIndex和maxindex
 每次循环 判断hash中是否已经存在该key 如果存在并且index大于minIndex则出现重复字符，更新length和minIndex
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var minIndex = 0
    var lenght = 0
    var hash = [Character: Int]()
    for (index, char) in s.enumerated() {
        if let i = hash[char], i>=minIndex  {//由于初试minIndex为0 如果出现和第一个字符重复必须i = minIndex 才能进if
            minIndex = i + 1
        }
        hash[char] = index
        lenght = max(index-minIndex+1, lenght)
    }
    return lenght
}

lengthOfLongestSubstring("pwwkew")
