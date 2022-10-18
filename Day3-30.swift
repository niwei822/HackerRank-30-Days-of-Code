//
//  Day3-30.swift
//  
//
//  Created by cecily li on 10/12/22.
//

import Foundation
//Day3
/*Task
 Given an integer, , perform the following conditional actions:

 If  is odd, print Weird
 If  is even and in the inclusive range of  to , print Not Weird
 If  is even and in the inclusive range of  to , print Weird
 If  is even and greater than , print Not Weird
 Complete the stub code provided in your editor to print whether or not  is weird.*/
guard let N = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }
switch (N % 2 == 0, N >= 6 && N <= 20) {
        case (true, false):
        print("Not Weird")
        default:
        print("Weird")
    }

//Day4
/*Write a Person class with an instance variable,age , and a constructor that takes an integer, ,initialAge as a parameter. The constructor must assign initialAge to age after confirming the argument passed as initialAge is not negative; if a negative argument is passed as initialAge, the constructor should set age  to  0 and print Age is not valid, setting age to 0.. In addition, you must write the following instance methods:
 
 yearPasses() should increase the age instance variable by 1.
 amIOld() should perform the following conditional actions:
 If age < 13 , print You are young..
 If age >=13  and age < 18 , print You are a teenager..
 Otherwise, print You are old..*/

class Person {
    var age: Int = 0

    init(initialAge: Int) {
        // Add some more code to run some checks on initialAge
        self.age = initialAge
        if initialAge < 0 {
            age = 0
            print("Age is not valid, setting age to 0.")
        }
    }

    func amIOld() {
        // Do some computations in here and print out the correct statement to the console
        if age < 13 {
            print("You are young.")
        }
        else if age >= 13 && age < 18 {
            print("You are a teenager.")
        }
        else {
            print("You are old.")
        }
    }

    func yearPasses() {
        // Increment the age of the person in here
        age += 1
    }
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let age = Int(readLine()!)!
    let p = Person(initialAge: age)

    p.amIOld()

    for i in 1...3 {
        p.yearPasses()
    }

    p.amIOld()

    print("")
}

//Day5
/*Given an integer, , print its first  multiples. Each multiple  (where ) should be printed on a new line in the form: n x i = result.*/
guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }
for i in 1...10 {
    print("\(n) x \(i) = \(n * i)")
}

//Day6
/*Given a string, , of length  that is indexed from  to , print its even-indexed and odd-indexed characters as  space-separated strings on a single line (see the Sample below for more detail).*/
let numStrings = Int(readLine()!)!

func printEvenAndOdd(string: String) {
    // This prints inputString to stderr for debugging:
    fputs("string: " + string + "\n", stderr)
    
    // Print the even-indexed characters
    // Write your code here
    var evenstring = ""
    var oddstring = ""
    
    for (index, char) in string.enumerated() {
        if index % 2 == 0 {
            evenstring.append(char)
        } else {
            oddstring.append(char)
        }
    }
    print(evenstring + " " + oddstring)
    // Print the odd-indexed characters
    // Write your code here
}

for _ in 1...numStrings {
    let inputString = readLine()!
    printEvenAndOdd(string: inputString)
}

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

//Day8
/*Given  names and phone numbers, assemble a phone book that maps friends' names to their respective phone numbers. You will then be given an unknown number of names to query your phone book for. For each  queried, print the associated entry from your phone book on a new line in the form name=phoneNumber; if an entry for  is not found, print Not found*/
guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var phonebook = [String: String]()

for i in 1...n {
    guard let phone = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
    let phone_split = phone.split(separator: " ")
    phonebook[String(phone_split[0])] = String(phone_split[1])
}

guard phonebook.count == n else { fatalError("Bad input") }

while let name = readLine() {
    guard name != "" else { break }
    if phonebook.keys.contains(name) {
        print(name + "=" + phonebook[name]!)
    } else {
        print("Not found")
    }
}

//Day9
//Recursive Method for Calculating Factorial
/*
 * Complete the 'factorial' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER n as parameter.
 */

func factorial(n: Int) -> Int {
    // Write your code here
if n <= 1 {
    return 1
}
return n * factorial(n: n - 1)
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = factorial(n: n)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

