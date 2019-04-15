//
//  main.swift
//  OddOccurrencesInArray
//
//  Created by yangpc on 2019. 4. 13..
//  Copyright © 2019년 yang hee jung. All rights reserved.
//

import Foundation

public func solution(_ A : inout [Int]) -> Int {
    var notPairedNumber: Int = 0

    for number in A {
        notPairedNumber = number ^ notPairedNumber
    }
    return notPairedNumber
}


var a = [9,3,9,3,9,7,9]

print(solution(&a))
