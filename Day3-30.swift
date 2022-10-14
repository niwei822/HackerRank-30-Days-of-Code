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

