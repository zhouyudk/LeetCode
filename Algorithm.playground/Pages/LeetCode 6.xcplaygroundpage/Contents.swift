//: [Previous](@previous)

import Foundation

/*
 6. Z 字形变换
 将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。

 比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：

 L   C   I   R
 E T O E S I I G
 E   D   H   N
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。

 请你实现这个将字符串进行指定行数变换的函数：

 string convert(string s, int numRows);
 示例 1:

 输入: s = "LEETCODEISHIRING", numRows = 3
 输出: "LCIRETOESIIGEDHN"
 示例 2:

 输入: s = "LEETCODEISHIRING", numRows = 4
 输出: "LDREOEIIECIHNTSG"
 解释:

 L     D     R
 E   O E   I I
 E C   I H   N
 T     S     G

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zigzag-conversion
 */

class Solution {
    /*
    思路 格式话字符串为二维数组 对于不满一列的数组使用Optional(nil)补满
    这是由于String的遍历结果为Character类型  Character无法为使用空字符串初始化，所以使用Optinal代替，但是导致最后拼接结果时必须依次判空
    增加了执行时间
    */
    func convert1(_ s: String, _ numRows: Int) -> String {
        guard s.count>1 && numRows>1 else {
            return s
        }
        var column = 0
        var resultArr : [[Character?]] = []
        var sArr: [Character] = []
        for c in s {
            sArr.append(c)
        }

        var index = 0
        while index<sArr.count {
            let remainder = column%(numRows-1)
            var hArray: [Character?] = []
            if remainder == 0 {
                let maxIndex = index+numRows<sArr.count ? index+numRows : sArr.count
                for i in index..<maxIndex {
                    hArray.append(sArr[i])
                }
                //针对字符串末尾 可能不足一列的情况
                if hArray.count < numRows {
                    hArray += Array<Character?>(repeating: Optional(nil), count: numRows-hArray.count)
                }
                resultArr.append(hArray)
                index = maxIndex
            } else {
                hArray = Array<Character?>(repeating: Optional(nil), count: numRows)
                hArray[numRows-1-remainder] = sArr[index]
                resultArr.append(hArray)
                index += 1
            }
            column += 1
        }
        var result = [Character]()
        for i in 0..<numRows {
            for j in 0..<resultArr.count {
                if let r = resultArr[j][i] {
                    result.append(r)
                }
            }
        }
        return String(result)
    }

    /*
     参考官方解答
     */
    func convert(_ s: String, _ numRows: Int) -> String {
        guard s.count>1 && numRows>1 else {
            return s
        }
        var resultArr = Array<String>(repeating: "", count: min(s.count,numRows))
        var isGoingDown = false
        var curRow = 0
        for c in s {
            resultArr[curRow].append(c)
            if curRow == 0 || curRow == numRows-1 {
                isGoingDown = !isGoingDown
            }
            curRow += isGoingDown ? 1 : -1
        }
        var result = ""
        for str in resultArr {
            result += str
        }
        return result
    }
}

Solution().convert("PAYPALISHIRING", 3)
