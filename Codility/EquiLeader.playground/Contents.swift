import Cocoa

public func solution(_ A : inout [Int]) -> Int {
    var leftList: [Int: Int] = [:]
    var rightList: [Int: Int] = [:]

    for index in 0..<A.count {
        let key: Int = A[index]
        rightList.update(for: key)
    }

    var equiLeaderCount: Int = 0
    var leader: Int = A[0]

    for index in 0..<A.count {
        let key: Int = A[index]
        rightList[key]! -= 1
        leftList.update(for: key)

        if index == 0 || leftList[leader]! < leftList[key]! {
            leader = A[index]
        }

        let leftCount: Int = index+1
        let halfLeftCount: Int = leftCount/2
        let rightCount: Int = A.count - leftCount
        let halfRightCount: Int = rightCount/2


        if halfLeftCount < leftList[leader]!
            && halfRightCount < rightList[leader]! {
            equiLeaderCount += 1
        }
    }

    return equiLeaderCount

}

extension Dictionary where Key == Int, Value == Int {

    mutating func update(for key: Int) {
        if let value = self[key] {
            updateValue(value+1, forKey: key)
        } else {
            updateValue(1, forKey: key)
        }
    }

}

var A = [3,4,4,4,4,2]
print(solution(&A))
