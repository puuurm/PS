import Cocoa

public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {

    let map: Dictionary<Character, Int> = ["A": 1, "C": 2, "G": 3, "T": 4]

    let sequence = Set(S)
    if sequence.count == 1, let character = sequence.first, let mapValue = map[character] {
        return Array(repeating: mapValue, count: P.count)
    }

    var result: [Int] = []
    for index in 0..<P.count {
        let start = String.Index(encodedOffset: P[index])
        let end = String.Index(encodedOffset: Q[index])
        let sequence = Set(S[start...end])
        var minimum = Int.max

        for character in sequence {
            guard let mapValue = map[character] else { continue }
            minimum = min(minimum, mapValue)
        }

        result.append(minimum)
    }

    return result
}

var P = [1,2,3]
var Q = [4,3,5]

var S = "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG"


print(solution(&S, &P, &Q))
