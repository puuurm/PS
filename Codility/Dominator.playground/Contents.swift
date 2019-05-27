import Cocoa

public func solution(_ A : inout [Int]) -> Int {
    let count: Int = A.count
    let half: Int = count/2

    var countList: [Int: Int] = [:]

    for index in 0..<count {
        let key: Int = A[index]
        countList.update(for: key)

        if countList[key]! > half {
            return index
        }
    }
    return -1
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
