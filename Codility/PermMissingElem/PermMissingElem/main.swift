//
//  main.swift
//  PermMissingElem
//
//  Created by yangpc on 2019. 4. 16..
//  Copyright © 2019년 yang hee jung. All rights reserved.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {
    let totalSum = (1...A.count+1).reduce(0) { $0 + $1 }
    let sumOfA = A.reduce(0) { $0 + $1 }

    return totalSum - sumOfA
}

var array: [Int] = [2,3,1,5]

print(solution(&array))
