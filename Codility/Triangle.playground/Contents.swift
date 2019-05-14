import Cocoa

public func solution(_ A : inout [Int]) -> Int {
    let sortedList: [Int] = A.sorted()
    let count: Int = sortedList.count

    for index in 0..<count where index+2 < count {
        if sortedList[index] + sortedList[index+1] > sortedList[index+2] {
            return 1
        }
    }
    return 0
}
