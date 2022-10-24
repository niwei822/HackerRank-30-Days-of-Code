//
//  HackerRankOneMonthChallenge.swift
//  
//
//  Created by cecily li on 10/17/22.
//

import Foundation
/*Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero. Print the decimal value of each fraction on a new line with  6 places after the  decimal. */

func plusMinus(arr: [Int]) -> Void {
    // Write your code here
let n = Double(arr.count)
var zeroNums: [Int] = []
var positiveNums: [Int] = []
var negativeNums: [Int] = []
for num in arr {
    if num == 0 {
        zeroNums.append(num)
    } else if num > 0 {
        positiveNums.append(num)
    } else {
        negativeNums.append(num)
    }
}
print(String(format: "%.6f", Double(positiveNums.count) / n))
print(String(format: "%.6f",Double(negativeNums.count) / n))
print(String(format: "%.6f",Double(zeroNums.count) / n))
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

plusMinus(arr: arr)

/*Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.
 * Complete the 'miniMaxSum' function below.
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func miniMaxSum(arr: [Int]) -> Void {
    // Write your code here
let newArr = arr.sorted()
var sum = 0
for i in 0..<newArr.count {
    sum += newArr[i]
}
print("\(sum - newArr[newArr.count - 1]) \(sum - newArr[0])")
}

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == 5 else { fatalError("Bad input") }

miniMaxSum(arr: arr)

/*Given a time in -hour AM/PM format, convert it to military (24-hour) time.
 
 Note: - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.
 - 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.*/
/*
 * Complete the 'timeConversion' function below.
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func timeConversion(s: String) -> String {
    // Write your code here
    let arr = s.components(separatedBy: ":")
    let i = arr.count - 1
    let time = arr[i].dropLast(2)
    let new = s.dropLast(2)
    if arr[i].contains("P") && arr[0] != "12" {
        let hour = Int(arr[0])! + 12
        return "\(hour):\(arr[1]):\(time)"
    } else if arr[i].contains("A") && arr[0] == "12" {
        return "00:\(arr[1]):\(time)"
    } else {
        return String(new)
    }
}
let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

let result = timeConversion(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

/*
 * Complete the 'matchingStrings' function below.
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts following parameters:
 *  1. STRING_ARRAY strings
 *  2. STRING_ARRAY queries
 */

func matchingStrings(strings: [String], queries: [String]) -> [Int] {
    // Write your code here
    var dict = [String: Int]()
    for string in strings {
        if dict.keys.contains(string) {
            dict[string]! += 1
        } else {
            dict[string] = 1
        }
    }
    var result = [Int]()
    for query in queries {
        if dict.keys.contains(query){
            result.append(dict[query]!)
        } else {
            result.append(0)
        }
     }
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let stringsCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var strings = [String]()

for _ in 1...stringsCount {
    guard let stringsItem = readLine() else { fatalError("Bad input") }

    strings.append(stringsItem)
}

guard strings.count == stringsCount else { fatalError("Bad input") }

guard let queriesCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var queries = [String]()

for _ in 1...queriesCount {
    guard let queriesItem = readLine() else { fatalError("Bad input") }

    queries.append(queriesItem)
}

guard queries.count == queriesCount else { fatalError("Bad input") }

let res = matchingStrings(strings: strings, queries: queries)

fileHandle.write(res.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
//another solution
func matchingStrings1(strings: [String], queries: [String]) -> [Int] {
    var count:[Int] = []
    for i in 0..<queries.count {
        var num = 0
        for j in 0..<strings.count {
            if queries[i] == strings[j] {
                num += 1
            }
        }
        count.append(num)
    }
    return count
}

/*
 * Complete the 'diagonalDifference' function below.
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY arr as parameter.
 */

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
var sum1 = 0
var sum2 = 0
for i in 0..<arr.count {
    sum1 += arr[i][i]
    sum2 += arr[i][arr.count - 1 - i]
}
return abs(sum1 - sum2)
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var arr = [[Int]]()

for _ in 1...n {
    guard let arrRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let arrRow: [Int] = arrRowTemp.split(separator: " ").map {
        if let arrItem = Int($0) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == n else { fatalError("Bad input") }

    arr.append(arrRow)
}

guard arr.count == n else { fatalError("Bad input") }

let result = diagonalDifference(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

/*
 * Complete the 'countingSort' function below.
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func countingSort(arr: [Int]) -> [Int] {
    // Write your code here
    var result = [Int](repeating: 0, count: 100)
    for i in 0...arr.count - 1 {
        result[arr[i]] += 1
    }
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

let result = countingSort(arr: arr)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

//Pangrams
/*A pangram is a string that contains every letter of the alphabet. Given a sentence determine whether it is a pangram in the English alphabet. Ignore case. Return either pangram or not pangram as appropriate.*/
func pangrams(s: String) -> String {
    // Write your code here
    let letterArr: [Character] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let newStr = s.uppercased().filter {!$0.isWhitespace}
    //print(newStr)
    let arr = Array(Set(Array(newStr))).sorted()
    print(arr)
    if letterArr == arr {
        return "pangram"
    }
    return "not pangram"
}
//Permuting Two Arrays
/* The function is expected to return a STRING.
 * The function accepts following parameters:
 *  1. INTEGER k
 *  2. INTEGER_ARRAY A
 *  3. INTEGER_ARRAY B
 */
func twoArrays(k: Int, A: [Int], B: [Int]) -> String {
    // Write your code here
    let C = A.sorted()
    let D = Array(B.sorted().reversed())
    for i in 0..<C.count {
        if C[i] + D[i] < k {
            return "NO"
        }
    }
    return "YES"
}
/*
 Two children, Lily and Ron, want to share a chocolate bar. Each of the squares has an integer on it.
 Lily decides to share a contiguous segment of the bar selected such that:
 The length of the segment matches Ron's birth month, and,
 The sum of the integers on the squares is equal to his birth day.
 Determine how many ways she can divide the chocolate.
 */

func birthday(s: [Int], d: Int, m: Int) -> Int {
    // Write your code here
    var num = 0
    for i in 0...s.count {
        var total = 0
        var j = i
        var k = 0
        while k < m && j < s.count {
            total += s[j]
            k += 1
            j += 1
        }
        if total == d {
            num += 1
        }
    }
    return num
}
/*There is a large pile of socks that must be paired by color. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.*/
func sockMerchant(n: Int, ar: [Int]) -> Int {
    // Write your code here
    var new = [Int:Int]()
    var sum = 0
    for i in ar {
        if new.keys.contains(i) {
            new[i]! += 1
        } else {
            new[i] = 1
        }
    }
    for key in new.keys {
        sum += new[key]! / 2
    }
    return sum
}
/*Sean invented a game involving a matrix where each cell of the matrix contains an integer. He can reverse any of its rows or columns any number of times. The goal of the game is to maximize the sum of the elements in the submatrix located in the upper-left quadrant of the matrix.
Given the initial configurations for matrices, help Sean reverse the rows and columns of each matrix in the best possible way so that the sum of the elements in the matrix's upper-left quadrant is maximal.*/

func flippingMatrix(matrix: [[Int]]) -> Int {
    // Write your code here
    let r = matrix.count - 1
    let c = matrix.count / 2
    var sum = 0
    for ri in 0...c - 1 {
        for ci in 0...c - 1 {
            var max_num = max(matrix[ri][ci], matrix[ri][r - ci], matrix[r -
                                                                         ri][ci], matrix[r - ri][r - ci])
            sum += max_num
        }
    }
    return sum }
