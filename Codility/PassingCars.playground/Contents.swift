import Cocoa

public func solution(_ A : inout [Int]) -> Int {

    var tempValue: Int = 0
    var totalValue: Int = 0

    let start: Int = A.count-1
    let end: Int = A.startIndex-1
    let reversed: Int = -1

    for index in stride(from: start, to: end, by: reversed) {
        if A[index] == 0 {
            totalValue += tempValue
        } else {
            tempValue += 1
        }

        if totalValue > 1000000000 { return -1 }
    }
    return totalValue
}
