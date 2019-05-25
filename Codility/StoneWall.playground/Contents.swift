import Cocoa

public func solution(_ H : inout [Int]) -> Int {
    var result: Int = 0
    let count: Int = H.count
    var stack: [Int] = []

    for index in 0..<count {
        let value: Int = H[index]

        if stack.isEmpty {
            stack.append(value)
            result += 1
        }

        if let last = stack.last {
            if last > value {
                if stack.contains(value) {
                    while !stack.isEmpty {
                        let lastInStack = stack.removeLast()
                        if lastInStack == value {
                            break
                        }
                    }
                } else {
                    result += 1
                }
            } else if last < value {
                stack.append(value)
                result += 1
            }
        }

    }
    return result
}
