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
