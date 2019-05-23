import Cocoa

public func solution(_ S : inout String) -> Int {

    if S.isEmpty { return Constant.nested }
    else {
        let first = S.removeFirst()
        var stack: [Character] = []
        stack.append(first)

        for charactor in S {
            if let last = stack.last,
                last == Constant.openBracket &&
                    charactor == Constant.closeBracket {
                stack.removeLast()
            } else {
                stack.append(charactor)
            }
        }
        return stack.isEmpty ? Constant.nested : Constant.notNested
    }

}

enum Constant {
    static let notNested: Int = 0
    static let nested: Int = 1
    static let openBracket: Character = "("
    static let closeBracket: Character = ")"
}
