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

