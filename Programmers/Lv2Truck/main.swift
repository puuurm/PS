//
//  main.swift
//  Algorithm1
//
//  Created by yangpc on 2019. 4. 7..
//  Copyright © 2019년 yang hee jung. All rights reserved.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var loadedTrucks: [Truck] = []
    var totlalTime: Int = 0
    var index: Int = 0

    while index < truck_weights.count || !loadedTrucks.isEmpty {

        if let firstLoadedTruck = loadedTrucks.first,
            firstLoadedTruck.remainTime == 0 {
            loadedTrucks.removeFirst()
        }


        if index < truck_weights.count
            && sum(of: loadedTrucks) + truck_weights[index] <= weight {
            let loadedTruck = Truck(weight: truck_weights[index], remainTime: bridge_length)
            loadedTrucks.append(loadedTruck)

            index += 1
        }

        loadedTrucks.forEach { $0.remainTime -= 1 }

        totlalTime += 1

    }


    return totlalTime
}

func sum(of list: [Truck]) -> Int {
    if list.isEmpty { return 0 }
    return list.reduce(0) { $0 + $1.weight }
}

class Truck {
    var weight: Int
    var remainTime: Int

    init(weight: Int, remainTime: Int) {
        self.weight = weight
        self.remainTime = remainTime
    }
}

print(solution(100, 100, [10,10,10,10,10,10,10,10,10,10]))
