//
//  main.swift
//  BinaryGap
//
//  Created by yangpc on 2019. 4. 11..
//  Copyright © 2019년 yang hee jung. All rights reserved.
//

import Foundation

public func solution(_ N : Int) -> Int {
    return binaryMaxGap(where: N)
}

func binaryMaxGap(where number: Int) -> Int {
    let binaryString = String(number, radix: 2)
    var indexListOfOne: [Int] = indices(of: "1", where: binaryString)

    var maxCount = 0
    var index = indexListOfOne.count - 1

    while index >= 1 {
        let post = indexListOfOne[index]
        let prev = indexListOfOne[index-1]
        maxCount = max(post-prev-1, maxCount)
        index -= 1
    }

    return maxCount
}


func indices(of character: Character, where string: String) -> [Int] {
    return string.enumerated()
        .filter { $0.element == character }
        .map { return $0.offset }

}

print(solution(1376796946))
