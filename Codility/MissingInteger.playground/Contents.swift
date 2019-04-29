import Cocoa

public func solution(_ A : inout [Int]) -> Int {

    let sortedList = A.sorted()

    guard let lastElement = sortedList.last,
        lastElement > 0
        else { return 1 }

    var countList = Array(repeating: 0, count: lastElement)

    for index in 0..<A.count
        where sortedList[index] > 0 {
        countList[sortedList[index]-1] += 1
    }

    for index in 0..<countList.count
        where countList[index] == 0 {
            return index + 1
    }
    return countList.count + 1
}

var list = [1, 2, 3]

print(solution(&list))
