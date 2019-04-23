import Cocoa

public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    let lastIndex: Int = A.count - 1
    let reversed: Int = -1
    let emptyValue: Int = -1

    var indices = Array(repeating: emptyValue, count: X+1)
    for index in stride(from: lastIndex, to: -1, by: reversed) {
        indices[A[index]] = index
    }

    if indices[1...X].contains(-1) { return -1 }
    else {
        var maxValue: Int = 0
        for indexValue in indices {
            maxValue = max(indexValue, maxValue)
        }
        return maxValue
    }
}
var A = [1,1,1,1,1]
print(solution(1, &A))
