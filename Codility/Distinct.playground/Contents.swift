import Cocoa

public func solution(_ A : inout [Int]) -> Int {
    let setA = Set(A)
    print(setA)
    return setA.count
}

var list = [2, 1, 1, 2, 3, 1]

solution(&list)

