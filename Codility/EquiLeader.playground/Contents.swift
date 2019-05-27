import Cocoa

public func solution(_ A : inout [Int]) -> Int {
    var leftList: [Int: Int] = [:]
    var rightList: [Int: Int] = [:]

    for index in 0..<A.count {
        let key: Int = A[index]
        if let value = rightList[key] {
            rightList.updateValue(value+1, forKey: key)
        } else {
            rightList.updateValue(1, forKey: key)
        }
    }

    var numberOfEquiLeader: Int = 0
    var leader: Int = A[0]

    for index in 0..<A.count {
        let key: Int = A[index]
        rightList[key]! -= 1
        if let value = leftList[key] {
            leftList.updateValue(value+1, forKey: key)
        } else {
            leftList.updateValue(1, forKey: key)
        }

        if index == 0 || leftList[leader]! < leftList[key]! {
            leader = A[index]
        }


        if (index+1) / 2 < leftList[leader]! && (A.count - (index+1)) / 2 < rightList[leader]! {
            numberOfEquiLeader += 1
        }
    }



    return numberOfEquiLeader

}
