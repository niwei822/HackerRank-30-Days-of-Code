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
