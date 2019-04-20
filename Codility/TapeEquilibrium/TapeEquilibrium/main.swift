//
//  main.swift
//  TapeEquilibrium
//
//  Created by yangpc on 2019. 4. 20..
//  Copyright © 2019년 yang hee jung. All rights reserved.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {

    var frontValue: Int = 0
    var backValue: Int = A.reduce(0) { $0 + $1 }
    var minimum: Int = Int.max
    for index in 1..<A.count {
        frontValue += A[index - 1]
        backValue -= A[index - 1]

        minimum = min(minimum, abs(frontValue-backValue))
    }
    return minimum
}
