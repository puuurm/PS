import Cocoa

public func solution(_ A : inout [Int]) -> Int {
    var bigPosition: [Int] = []
    var smallPosition: [Int] = []
    let count: Int = A.count

    for index in 0..<count {
        bigPosition.append(index + A[index])
        smallPosition.append(index - A[index])
    }
    var intersection: Int = 0
    var standard: Int = 0

    let sortedBig = bigPosition.sorted()
    let sortedSmall = smallPosition.sorted()

    for index in 0..<count {
        while standard < count && sortedBig[index] >= sortedSmall[standard] {
            intersection += standard
            intersection -= index
            standard += 1
        }
    }

    if intersection > 10000000 { return -1 }
    else { return intersection }
}
var list = [1,5,2,1,4,0]
solution(&list)
