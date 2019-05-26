import Cocoa

public func solution(_ A : inout [Int]) -> Int {
    let count: Int = A.count
    let half: Int = count/2
    let sortedA: [Int] = A.sorted()

    var countValue: Int = 0
    var dominator: Int = Int.max
    var prevValue: Int = Int.max
    for index in 0..<count {
        let currentValue: Int = sortedA[index]
        if prevValue != currentValue {
            prevValue = currentValue
            countValue = 1
        } else {
            countValue += 1
        }

        if countValue > half {
            dominator = currentValue
            break
        }
    }

    if dominator != Int.max {
        for index in 0..<count
            where A[index] == dominator {
            return index
        }
    }

    return -1
}
