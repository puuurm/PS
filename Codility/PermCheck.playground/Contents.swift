import Cocoa

public func solution(_ A : inout [Int]) -> Int {
    let falseFlag: Int = 0
    let trueFlag: Int = 1

    let permutationList = (1...A.count)
    let sortedA: [Int] = A.sorted()

    if sortedA.count != permutationList.count { return falseFlag }
    var xorComputedValue: Int = 0

    for (index, number) in permutationList.enumerated() {
        xorComputedValue += (sortedA[index] ^ number)
    }
    return xorComputedValue == 0 ? trueFlag : falseFlag
}
