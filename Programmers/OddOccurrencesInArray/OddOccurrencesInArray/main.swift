//
//  main.swift
//  OddOccurrencesInArray
//
//  Created by yangpc on 2019. 4. 13..
//  Copyright © 2019년 yang hee jung. All rights reserved.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    let set = Set(A)
    print(set)
    for number in set {
        let filterd = A.filter { $0 == number }
        if filterd.count == 1 { return number }
    }

    return 0

}

var a = [9,3,9,3,9,7,9]

print(solution(&a))
