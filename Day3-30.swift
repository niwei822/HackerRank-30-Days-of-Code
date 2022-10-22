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

//Day10
/*Given a base- integer, , convert it to binary (base-). Then find and print the base- integer denoting the maximum number of consecutive 's in 's binary representation. When working with different bases, it is common to show the base as a subscript.*/
guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var bin = [Int]()
var num = n
while num > 0 {
    let rem = num % 2
    num = num/2
    bin.insert(rem, at: 0)
}
var maxone = 0
var tmpmax = 0
for i in bin {
    if i == 1 {
        tmpmax += 1
        if tmpmax > maxone {
            maxone = tmpmax
        }
    } else {
        tmpmax = 0
    }
}
print(maxone)

//Day11
/*Calculate the hourglass sum for every hourglass in , then print the maximum hourglass sum.*/
var arr = [[Int]]()

for _ in 1...6 {
    guard let arrRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let arrRow: [Int] = arrRowTemp.split(separator: " ").map {
        if let arrItem = Int($0) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == 6 else { fatalError("Bad input") }

    arr.append(arrRow)
}

guard arr.count == 6 else { fatalError("Bad input") }

var sums = [Int]()
for i in 0...3 {
    for j in 0...3 {
        sums.append(arr[i][j] + arr[i][j+1] + arr[i][j+2] + arr[i+1][j+1] + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2])
    }
}
print(sums.max()!)

//Day12
/*You are given two classes, Person and Student, where Person is the base class and Student is the derived class. Completed code for Person and a declaration for Student are provided for you in the editor. Observe that Student inherits all the properties of Person.*/

class Person {
    private let firstName: String
    private let lastName: String
    private let id: Int

    // Initializer
    init(firstName: String, lastName: String, id: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
    }

    // Print person data
    func printPerson() {
        print("Name: \(lastName), \(firstName)")
        print("ID: \(id)")
    }
} // End of class Person

// Class Student
class Student: Person {
    private var scores: [Int]
    init(firstName: String, lastName: String, id: Int, scores: [Int]) {
        self.scores = scores
        super.init(firstName: firstName, lastName: lastName, id: id)
    }
    /*
    *   Initializer
    *
    *   Parameters:
    *   firstName - A string denoting the Person's first name.
    *   lastName - A string denoting the Person's last name.
    *   id - An integer denoting the Person's ID number.
    *   scores - An array of integers denoting the Person's test scores.
    */
    // Write your initializer here
    /*
    *   Method Name: calculate
    *   Return: A character denoting the grade.
    */
    // Write your method here
    
        
    /*
    *   Method Name: calculate
    *   Return: A character denoting the grade.
    */
    // Write your method here
    func calculate() -> Character {
        var sum = 0
        for score in scores {
            sum += score
        }
        let a = sum / scores.count
        switch a {
            case 90...100:
                return "O"
            case 80...91:
                return "E"
            case 70...81:
                return "A"
            case 55...71:
                return "P"
            case 40...51:
                return "D"
            default:
                return "T"
        }
    }
}
// End of class Student

let nameAndID = readLine()!.components(separatedBy: " ")
let _ = readLine()
let scores = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let s = Student(firstName: nameAndID[0], lastName: nameAndID[1], id: Int(nameAndID[2])!, scores: scores)

s.printPerson()

print("Grade: \(s.calculate())")



