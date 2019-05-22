import Cocoa

public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {

    var aliveCount: Int = 0
    var downStrems: [Int] = []

    for index in 0..<A.count {
        if B[index] == 0 {
            while !downStrems.isEmpty {
                if downStrems.last! > A[index] {
                    break
                } else {
                    downStrems.removeLast()
                }
            }
            if downStrems.isEmpty {
                aliveCount += 1
            }
        } else {
            downStrems.append(A[index])
        }
    }

    return aliveCount + downStrems.count

}

var A = [4,2,3,4,5]
var B = [0,0,0,1,0]

print(solution(&A, &B))

