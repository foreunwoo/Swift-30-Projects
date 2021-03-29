//
//  Animal.swift
//  AnimalSearch
//
//  Created by eunwoo on 2021/03/29.
//

import Foundation

struct Animal {
    let name: String
    let type: Type
    
    init(_ name: String, _ type: Type) {
        self.name = name
        self.type = type
    }
}

enum Type: String {
    case a = "포유류"
    case b = "양서류"
    case c = "파충류"
    case d = "조류"
}
