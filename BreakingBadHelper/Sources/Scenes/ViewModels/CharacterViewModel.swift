//
//  CharacterViewModel.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/15/22.
//

import Foundation
import RxSwift
import RxRelay

class CharacterViewModel {
    private var character: Character
    
    var displaySingleName: String {
        return character.name
    }
    
    var displaySingleNickname: String {
        return character.nickname
    }
    
    var displaySingleStatus: String {
        return character.status.rawValue
    }
    
    var displayImage: String
    
    var displayName: String
    
    var displayNickname: String
    
    var displayStatus: String
    
    var displayBirthday: String
    
    var displayAppearence: String
    
    var displayPortrayed: String
    
    init(character: Character) {
        self.character = character
        self.displayImage = character.img
        self.displayName = "Name: \(character.name)"
        self.displayNickname = "Nickname: \(character.nickname)"
        self.displayStatus = "Status: \(character.status.rawValue)"
        self.displayBirthday = "Birthdate: \(character.birthday)"
        self.displayAppearence = "Appeared in (seasons): " + character.appearance.map { String($0) }.joined(separator: ", ")
        self.displayPortrayed = "Portrayed by: \(character.portrayed)"
    }
}

extension CharacterViewModel {
    func getAllProperties() -> Observable<[String]> {
        let mirror = Mirror(reflecting: self).children.enumerated()
        var stringValues: [String] = []
        
        for (index, property) in mirror where index != 0 && index != 2 {
            stringValues.append(property.value as! String)
        }
    
        return Observable.just(stringValues)
    }
}
