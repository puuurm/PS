import Cocoa

public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {

    var result: [Int] = []

    let aList: [Int] = countChange(of: "A", where: S)
    let cList: [Int] = countChange(of: "C", where: S)
    let gList: [Int] = countChange(of: "G", where: S)

    for (p, q) in zip(P, Q) {
        let q = q+1
        let appearance = [aList[q]-aList[p], cList[q]-cList[p], gList[q]-gList[p]]
        if appearance[0] > 0 {
            result.append(1)
        } else if appearance[1] > 0 {
            result.append(2)
        }  else if appearance[2] > 0 {
            result.append(3)
        }  else {
            result.append(4)
        }

    }
    return result
}

func countChange(of character: Character, where string: String) -> [Int] {
    var changeList: [Int] = [0]
    for (index, dnaCharacter) in string.enumerated() {
        if dnaCharacter == character {
            changeList.append(changeList[index]+1)
        } else {
            changeList.append(changeList[index])
        }
    }
    return changeList
}

var P = [1,2,3]
var Q = [4,3,5]

var S = "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG"


print(solution(&S, &P, &Q))
