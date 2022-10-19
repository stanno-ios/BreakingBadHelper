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
    
    var name: String
    
    var nickname: String
    
    var status: String
    
    var birthday: String
    
    var appearences: String
    
    var portrayed: String
    
    init(character: Character) {
        self.character = character
        self.displayImage = character.img
        self.name = "\(character.name)"
        self.nickname = "\(character.nickname)"
        self.status = "\(character.status.rawValue)"
        self.birthday = "\(character.birthday)"
        self.appearences = "Seasons " + character.appearance.map { String($0) }.joined(separator: ", ")
        self.portrayed = "\(character.portrayed)"
    }
}

extension CharacterViewModel {
    func getAllProperties() -> Observable<[(String, String)]> {
        let mirror = Mirror(reflecting: self).children
        var stringValues: [(String, String)] = []
        
        for (key, value) in mirror where key != "character" && key != "displayName" {
            if let key = key, let value = value as? String {
                stringValues.append((key, value))
            }
        }
    
        return Observable.just(stringValues)
    }
}
