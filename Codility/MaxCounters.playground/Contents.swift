import Cocoa

public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var countList = Array(repeating: 0, count: N)
    var lastUpdatedMaxValue: Int = 0
    var currentMaxValue: Int = 0
    for value in A {
        let index = value - 1
        if index == N {
            lastUpdatedMaxValue = currentMaxValue
        } else {
            if countList[index] < lastUpdatedMaxValue {
                countList[index] = lastUpdatedMaxValue
            }
            countList[index] += 1
            currentMaxValue = max(currentMaxValue, countList[index])
        }
    }

    for index in 0..<countList.count
        where countList[index] < lastUpdatedMaxValue {
            countList[index] = lastUpdatedMaxValue
    }

    return countList
}



var A = [3, 4, 4, 6, 1, 4, 4]

print(solution(5, &A))

