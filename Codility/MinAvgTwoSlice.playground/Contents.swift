import Cocoa

public func solution(_ A : inout [Int]) -> Int {

    var minimumValue: Float = Float.greatestFiniteMagnitude
    var minimumAverageIndex: Int = 0

    for index in 0..<A.count {
        var average: Float = Float.greatestFiniteMagnitude
        if index+1 < A.count {
            average = min(average, calculateAverage(A, from: index, to: index+1))
        }

        if index+2 < A.count {
            average = min(average, calculateAverage(A, from: index, to: index+2))
        }

        if minimumValue > average {
            minimumValue = average
            minimumAverageIndex = index
        }
    }

    return minimumAverageIndex
}

func calculateAverage(_ list: [Int], from fromIndex: Int, to toIndex: Int) -> Float {
    var sum: Float = 0
    for index in fromIndex...toIndex {
        sum += Float(list[index])
    }

    return sum / Float((toIndex-fromIndex+1))
}
