//
//  Animal.swift
//  AnimalSearch
//
//  Created by eunwoo on 2021/03/29.
//

import Foundation

struct Animal {
    let name: String?
    let type: String?
    
    init(_ name: String, _ type: String) {
        self.name = name
        self.type = type
    }
}
