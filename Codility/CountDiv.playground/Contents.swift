import Cocoa

public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {

    return (B/K + 1) - ((A-1)/K + 1)
}


print(solution(100, 20000, 2))
