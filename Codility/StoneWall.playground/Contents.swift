import Cocoa

public func solution(_ H : inout [Int]) -> Int {
    var result: Int = 0
    let count: Int = H.count
    var stack: [Int] = []

    for index in 0..<count {
        let value: Int = H[index]

        guard let last = stack.last, last >= value else {
            stack.append(value)
            result += 1
            continue
        }

        if last > value {
            while true {
                guard let lastInStack = stack.last
                else {
                    stack.append(value)
                    result += 1
                    break
                }

                if lastInStack > value {
                    stack.removeLast()
                } else {
                    if lastInStack < value {
                        stack.append(value)
                        result += 1
                    }
                    break
                }
            }
        }
    }
    return result
}

var list = [2, 5, 1, 4, 6, 7, 9, 10, 1]
solution(&list)
