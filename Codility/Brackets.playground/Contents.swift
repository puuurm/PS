import Cocoa

public func solution(_ S : inout String) -> Int {
    var stack: String = ""

    for character in S {
        if let last = stack.last,
            isPair(x: last, y: character) {
            stack.removeLast()
        } else {
            stack.append(character)
        }
    }

    return stack.isEmpty ? 1 : 0
}

func isPair(x xValue: Character, y yValue: Character) -> Bool {
    let xCandidates: String = "{(["
    let yCandidates: String = "})]"

    for (x, y) in zip(xCandidates, yCandidates)
        where xValue == x && yValue == y {
            return true
    }
    return false

}

var test1 = "{[()()]}"
var test2 = "([)()]"

print(solution(&test1))
print(solution(&test2))

