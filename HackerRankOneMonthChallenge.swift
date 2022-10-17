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

