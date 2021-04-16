//
//  Monster.swift
//  PokemonGo
//
//  Created by eunwoo on 2021/04/16.
//

import Foundation

struct Monster {
    let name: String
    let oneType: String
    let twoType: String?
    
    init(name: String, oneType: String, twoType: String) {
        self.name = name
        self.oneType = oneType
        self.twoType = twoType
    }
}
