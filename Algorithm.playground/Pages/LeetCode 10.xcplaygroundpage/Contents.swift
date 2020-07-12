//: [Previous](@previous)

import Foundation

/*
 10. 正则表达式匹配
 给你一个字符串 s 和一个字符规律 p，请你来实现一个支持 '.' 和 '*' 的正则表达式匹配。

 '.' 匹配任意单个字符
 '*' 匹配零个或多个前面的那一个元素
 所谓匹配，是要涵盖 整个 字符串 s的，而不是部分字符串。

 说明:

 s 可能为空，且只包含从 a-z 的小写字母。
 p 可能为空，且只包含从 a-z 的小写字母，以及字符 . 和 *。
 示例 1:

 输入:
 s = "aa"
 p = "a"
 输出: false
 解释: "a" 无法匹配 "aa" 整个字符串。
 示例 2:

 输入:
 s = "aa"
 p = "a*"
 输出: true
 解释: 因为 '*' 代表可以匹配零个或多个前面的那一个元素, 在这里前面的元素就是 'a'。因此，字符串 "aa" 可被视为 'a' 重复了一次。
 示例 3:

 输入:
 s = "ab"
 p = ".*"
 输出: true
 解释: ".*" 表示可匹配零个或多个（'*'）任意字符（'.'）。
 示例 4:

 输入:
 s = "aab"
 p = "c*a*b"
 输出: true
 解释: 因为 '*' 表示零个或多个，这里 'c' 为 0 个, 'a' 被重复一次。因此可以匹配字符串 "aab"。
 示例 5:

 输入:
 s = "mississippi"
 p = "mis*is*p*."
 输出: false
 */
/*
 思路
 */
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        print(s,"______",p)
        //当表达式为空 则s为空则true不为空则false
        if p.count == 0 {
            return s.count == 0
        } else {
            if s.count == 0 {
                if let l = p.last, l != Character("*") {
                    return false
                }
            }
        }
        var sArr: Array<Character> = []
        var pArr: Array<Character> = []
        /// "."
        let pointChar = Character(".")
        /// "#"
        let wellNumberChar = Character("#")
        /// "*"
        let asteriskChar = Character("*")
        for c in s {
            sArr.append(c)
        }
        //格式化p
        //1 将p中的.*转化为#，并将连续的#压缩为1个，a*a*压缩为a*
        //2 对于*前后字符相同的情况，将*向右侧移动，如aa*aaa ,转化为aaaaa*
        var pTmpArr: Array<Character> = []
        for c in p {
            if pTmpArr.count >= 3
                && c == asteriskChar
                && pTmpArr.last == pTmpArr[pTmpArr.count-3] {
                pTmpArr.removeLast(1)
            } else {
                pTmpArr.append(c)
            }
        }
        for c in pTmpArr {
            if c == asteriskChar && pArr.last == pointChar {
                pArr[pArr.count-1] = wellNumberChar
            } else {
                if pArr.count-1>0 && asteriskChar == pArr[pArr.count-1] && c == pArr[pArr.count-2]  {
                    pArr[pArr.count-1] = c
                    pArr.append(asteriskChar)
                } else {
                    pArr.append(c)
                }
            }
        }
        
        //首先从后往前遍历p 直到找到*为止
        var sRight = sArr.count-1
        var pRight = pArr.count-1

        while sRight>=0 && pRight>=0 {
            if pArr[pRight] == wellNumberChar || pArr[pRight] == asteriskChar {
                break
            }
            if pArr[pRight] == pointChar || pArr[pRight] == sArr[sRight] {
                sRight -= 1
                pRight -= 1
                continue
            }
            return false
        }

//        if sRight < 0 && pRight < 0 {
//            return true
//        } else if sRight >= 0 && pRight < 0 {
//            return false
//        } else {
//            if pRight == 0 && pArr[pRight] == wellNumberChar {
//                return true
//            } else {
//                return false
//            }
//        }
        
        //sRight 和 pRight 都是大于等于0的
        var sLeft = 0
        var pLeft = 0
        var wellNumIndex = -1//“#”号的index
        print(sArr,pArr)
        while sLeft <= sRight && pLeft <= pRight {
            //p中字符为.
            if pArr[pLeft] == pointChar || pArr[pLeft] == sArr[sLeft] {
                sLeft += 1
                pLeft += 1
                continue
            }
            //判断是否为“#”
            if pArr[pLeft] == wellNumberChar {
                if pLeft == pRight {
                    return true
                } else {
                    wellNumIndex = pLeft+1
                    pLeft += 1
                    continue
                }
            }
            //如果此次遍历的s和p中字符不匹配，
            
            if pArr[pLeft] != sArr[sLeft] {
                //1 p中“*”,则*前的字符已经为s中的字符匹配，并继续匹配s中与*前字符是否相同
                if pArr[pLeft] == asteriskChar {
                    if sArr[sLeft] == pArr[pLeft-1] {
                        sLeft += 1
                        continue
                    } else {
                        pLeft += 1
                        continue
                    }
                } else {
                    //2 p中不为“*”，判断下一个是否为“*”
                    if pLeft+1 <= pRight && pArr[pLeft+1] == asteriskChar {
                        pLeft += 2
                        continue
                    }
                }
                
                //当出现“#”后的字符不匹配时
                if wellNumIndex != -1 {
                    pLeft = wellNumIndex
                    sLeft += 1
                    continue
                }
                return false
            }
            
        }
        //遍历结束后，p和s都完成遍历 则肯定匹配
        if sLeft > sRight && pLeft > pRight {
            return true
        } else {
            //如果只有p完成 s位完成则不匹配
            if sLeft <= sRight {
                return false
            }
            // 如果s完成 则判断p中剩余字符能否匹配长度为0的字符串
            if pLeft == pRight {
                return (pArr[pLeft] == wellNumberChar || pArr[pLeft] == asteriskChar)
            }
            if pLeft < pRight {
                if pArr[pRight] != wellNumberChar && pArr[pRight] != asteriskChar {
                    return false
                }
                var isLastEqualToAstAndWellNum = false
                print(sLeft,sRight,pLeft,pRight)
                var pResult: Array<Character> = []
                for i in pLeft...pRight {
                    if pArr[i] == wellNumberChar {
                        continue
                    }
                    if pArr[i] == asteriskChar {
                        if pResult.count > 0 {
                            pResult.removeLast(1)
                        }
                        continue
                    }
                    pResult.append(pArr[i])
                }
                return pResult.count == 0
            }
        }
        
        return true
    }
}
"aaa"
"ab*a*c*a"
Solution().isMatch("ab",".*b*")
