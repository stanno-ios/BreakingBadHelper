//
//  CharacterViewModel.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/15/22.
//

import Foundation

class CharacterViewModel {
    private var character: Character
    
    var displayImage: String {
        return character.img
    }
    
    var displayName: String {
        return character.name
    }
    
    var displayNickname: String {
        return character.nickname
    }
    
    var displayStatus: String {
        return character.status.rawValue
    }
    
    init(character: Character) {
        self.character = character
    }
}
