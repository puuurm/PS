import Cocoa

public func solution(_ A : inout [Int]) -> Int {
    let sortedList = A.sorted()
    return maximumProductOfThree(sortedList)
}

func maximumProductOfThree(_ sortedList: [Int]) -> Int {
    let count: Int = sortedList.count
    if count == 3 { return sortedList.reduce(1, *) }
    else {
        let leftThree: Int = multiplyNumbers(in: sortedList, indices: [0,1,2])
        let leftTwoRightOne: Int = multiplyNumbers(in: sortedList, indices: [0,1,count-1])
        let rightThree: Int = multiplyNumbers(in: sortedList, indices: [count-1, count-2, count-3])
        let rightTwoLeftOne: Int = multiplyNumbers(in: sortedList, indices: [count-1,count-2,0])

        let productList: [Int] = [leftThree, leftTwoRightOne, rightThree, rightTwoLeftOne]
        var maximumValue: Int = leftThree
        for number in productList {
            maximumValue = max(maximumValue, number)
        }
        return maximumValue

    }
}

func multiplyNumbers(in list: [Int], indices: [Int]) -> Int {
    var product: Int = 1
    for index in indices {
        product *= list[index]
    }
    return product
}
