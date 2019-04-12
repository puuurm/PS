//
//  main.swift
//  CyclicRotation
//
//  Created by yangpc on 2019. 4. 12..
//  Copyright © 2019년 yang hee jung. All rights reserved.
//

import Foundation

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    // write your code in Swift 4.2.1 (Linux)
    if A.isEmpty || K == 0 || K == A.count || A.count == 1 { return A }
    var newK = K
    if newK > A.count { newK = newK % A.count  }
    var unchangedSequence = A[A.count-newK...A.count-1]
    unchangedSequence += A[0...A.count-newK-1]
    return Array(unchangedSequence)
}

var A = [1,2,3]
let K = 5

print(solution(&A, K))
