import Cocoa

public func solution(_ A : inout [Int]) -> Int {
    let sortedList = A.sorted()
    return maximumProductOfThree(sortedList)
}

func maximumProductOfThree(_ list: [Int]) -> Int {
    let count: Int = list.count
    if count == 3 { return list.reduce(1, *) }
    else {
        let leftSum: Int = list[0]*list[1]*list[2]
        let leftTwoRightOneSum: Int = list[0]*list[1]*list[count-1]
        let rightSum: Int = list[count-1]*list[count-2]*list[count-3]
        let rightTwoLeftOne: Int = list[count-1]*list[count-2]*list[0]

        let sum: [Int] = [leftSum, leftTwoRightOneSum, rightTwoLeftOne, rightSum]
        var maximumValue: Int = leftSum
        for number in sum {
            maximumValue = max(maximumValue, number)
        }

        return maximumValue

    }
}
