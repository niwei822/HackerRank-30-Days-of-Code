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

//Day 13
/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */
func solution(A: [Int], K: Int) -> [Int] {
    // do your work here...
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    let i = A.count - 1 - K //i=2
    let arry1 = A[0...i]
    let arry2 = A[(i+1)...(A.count - 1)]
    let arry3 = arry2 + arry1
    return [Int](arry3)
}

print(solution(A: [1, 2, 3, 4, 5,6,7,8,8,10], K: 5)) // 5 1 2 3 4

//Day 14 Scope

class Difference {
    private var elements = [Int]()
    var maximumDifference: Int
    // Write your code here
    init (a: [Int]) {
        self.elements = a
        self.maximumDifference = 0
    }
    func computeDifference() {
        let new = a.sorted()
        maximumDifference = new[new.count - 1] - new[0]
    }
} // End of Difference class
let n = Int(readLine()!)!
let a = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let d = Difference(a: a)
d.computeDifference()
print(d.maximumDifference)

//Day15 Linked List
func insert(head: Node?, data: Int!) -> Node? {
    // Enter your code here.
    if head == nil {
        return Node(data: data)
    }
    var c = head
    while c!.next != nil {
        c = c!.next
    }
    c!.next = Node(data: data)
    return head
}
//Day16 exceptions
enum StringToIntTypecastingError: Error {
    case BadString
}
func stringToInt(inputString: String) throws {
    if Int(inputString) == nil {
    throw StringToIntTypecastingError.BadString
  }
  else {
    let result = Int(inputString)
    print(result!)
  }
}
let inputString = readLine()!

do {
    try print(stringToInt(inputString: inputString))
} catch StringToIntTypecastingError.BadString {
    print("Bad String")
}
//Day 17: More Exceptions
import Foundation
// Defining enum for throwing error
// throw RangeError.NotInRange... is used to throw the error
enum RangeError : Error {
    case NotInRange(String)
}
// Start of class Calculator
class Calculator {
    // Start of function power
    func power(n: Int, p: Int) throws -> Int {
        // Add your code here
        if n < 0 || p < 0 {
            throw RangeError.NotInRange("n and p should be non-negative")
        }
        else {
            pow(Double(n), Double(p))
        }
        return Int(pow(Double(n), Double(p)))
    }
    // End of function power
} // End of class Calculator

let myCalculator = Calculator()
let t = Int(readLine()!)!

for _ in 0..<t {
    let np = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let n = np[0]
    let p = np[1]
    
    do {
        let ans = try myCalculator.power(n: n, p: p)
        print(ans)
    } catch RangeError.NotInRange(let errorMsg) {
        print(errorMsg)
    }
}

//Day18 Queues and Stacks
class Solution {
    //Write your code here
    var queue = [Character]()
    var stack = [Character]()
    func pushCharacter(ch: Character) {
        stack.append(ch)
    }
    
    func popCharacter() -> Character {
        return stack.popLast()!
    }
    
    func enqueueCharacter(ch: Character) {
        queue.append(ch)
    }
    
    func dequeueCharacter() -> Character {
        return queue.remove(at: 0)
    }
}
//Day20 Bubble sort
// Write your code here
var numSwaps = 0
for i in 0..<n {
    for j in 0..<n - i - 1 {
        if a[j] > a[j+1] {
            let temp = a[j]
            a[j] = a[j+1]
            a[j+1] = temp
            numSwaps += 1
        }
    }
}
print("Array is sorted in \(numSwaps) swaps.")
print("First Element: \(a[0])")
print("Last Element: \(a[n - 1])")

//Day 21: Generics
// Write your code here
    func printArray(array : [T]) {
        for i in array {
            print(i)
        }
    }
}

//Day22 Binary Search Trees
class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(d : Int) {
        data  = d
    }
} // End of Node class
// Start of Tree class
class Tree {
    func insert(root: Node?, data: Int) -> Node? {
        if root == nil {
            return Node(d: data)
        }
        
        if data <= (root?.data)! {
            root?.left = insert(root: root?.left, data: data)
        } else {
            root?.right = insert(root: root?.right, data: data)
        }
        
        return root
    }
    
    func getHeight(root: Node?) -> Int {
        // Complete the function
        if root == nil {
            return -1
        }
        return 1 + max(getHeight(root: root?.left), getHeight(root: root?.right))
    } // End of getHeight function
    
    //Day 23: BST Level-Order Traversal
    // Start of Node class
    class Node {
        var data: Int
        var left: Node?
        var right: Node?
        
        init(d : Int) {
            data  = d
        }
    } // End of Node class
    // Start of Tree class
    class Tree {
        func insert(root: Node?, data: Int) -> Node? {
            if root == nil {
                return Node(d: data)
            }
            
            if data <= (root?.data)! {
                root?.left = insert(root: root?.left, data: data)
            } else {
                root?.right = insert(root: root?.right, data: data)
            }
            
            return root
        }
        
        func levelOrder(root: Node?) -> Void {
            // Complete the function
            var bst = [root]
            var data: [Int] = []
            while bst.count != 0 {
                guard let nod = bst.popLast() else {return}
                data.append(nod?.data ?? 0)
                if nod?.left != nil {
                    bst.insert(nod?.left, at: 0)
                }
                if nod?.right != nil {
                    bst.insert(nod?.right, at: 0)
                }
            }
            print(data.map { String($0) }.joined(separator: " "))
        } // End of levelOrder function
        
        
    } // End of Tree class
    
    var root: Node?
    let tree = Tree()
    
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        root = tree.insert(root: root, data: Int(readLine()!)!)
    }
    
    tree.levelOrder(root: root)
//Day24 remove duplicates from sorted list
    func removeDuplicates(head: Node?) -> Node? {
        // Add your code here
        var temp = head
        while temp != nil {
            if temp?.data == temp?.next?.data {
                temp?.next = temp?.next?.next
            }else {
                temp = temp?.next
            }
        }
        return head
    }
//Day25 checkPrime
    func checkPrime(n: Int) -> String {
        if n == 0 || n == 1 {
            return "Prime"
        }
        var count = 0
        for i in 1...n {
            if n % i == 0 {
                count += 1
            }
        }
        if count > 2 {
            return "Not Prime"
        }
        return "Prime"
    }
    checkPrime(n: 71)
