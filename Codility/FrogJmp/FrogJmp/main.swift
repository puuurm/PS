//
//  main.swift
//  FrogJmp
//
//  Created by yangpc on 2019. 4. 16..
//  Copyright © 2019년 yang hee jung. All rights reserved.
//

import Foundation

public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {

    let result = (Y - X) / D
    return (Y - X) % D == 0 ? result : result + 1

}

print(solution(10, 70, 30))
