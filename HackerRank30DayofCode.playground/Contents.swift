import UIKit

//Day1
var i = 4
var d = 4.0
var s = "HackerRank "
// Declare second integer, double, and String variables.
// Read and save an integer, double, and String to your variables.
// Print the sum of both integer variables on a new line.
// Print the sum of the double variables on a new line.
// Concatenate and print the String variables on a new line
// The 's' variable above should be printed first.
let a = readLine()
let b = readLine()
let c = readLine()
var a1 = Int(a!)
var b1 = Double(b!)
var c1 = String(c!)
print(i + a1!)
print(d + b1!)
print(s + c1)
//Day2
/*
 * Complete the 'solve' function below.
 *
 * The function accepts following parameters:
 *  1. DOUBLE meal_cost
 *  2. INTEGER tip_percent
 *  3. INTEGER tax_percent
 */
func solve(meal_cost: Double, tip_percent: Int, tax_percent: Int) -> Void {
    let tip_percent = Double(tip_percent)
    let tax_percent = Double(tax_percent)
    var cost = meal_cost / 100 * (tax_percent + tip_percent) + meal_cost
    let total_cost = Int(cost.rounded())
    print(total_cost)
}

guard let meal_cost = Double((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let tip_percent = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let tax_percent = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

solve(meal_cost: meal_cost, tip_percent: tip_percent, tax_percent: tax_percent)

//Day7
/*Given an array, , of  integers, print 's elements in reverse order as a single line of space-separated numbers.*/

 guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
 else { fatalError("Bad input") }

 guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

 let arr: [Int] = arrTemp.split(separator: " ").map {
     if let arrItem = Int($0) {
         return arrItem
     } else { fatalError("Bad input") }
 }

 guard arr.count == n else { fatalError("Bad input") }

 var A = arr.reversed()
 print(A.map { String($0) }.joined(separator: " "))

