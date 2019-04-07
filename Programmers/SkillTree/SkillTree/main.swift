//
//  main.swift
//  SkillTree
//
//  Created by yangpc on 2019. 4. 7..
//  Copyright © 2019년 yang hee jung. All rights reserved.
//

import Foundation

func solution(_ skill: String, _ skill_trees: [String]) -> Int {

    return skill_trees.filter { (word) in
        return checkTree(tree: word, skill: skill)
    }.count

}

func checkTree(tree: String, skill: String) -> Bool {
    var mismatchAtFirst: Bool = false
    var lastMatchedIndex: Int = 0

    for skillCharacter in skill {
        guard let positionInTree = tree.index(of: skillCharacter) else {
            mismatchAtFirst = true
            continue
        }

        if mismatchAtFirst || positionInTree.encodedOffset < lastMatchedIndex {
            return false
        }
        lastMatchedIndex = positionInTree.encodedOffset
    }
    return true
}


print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
