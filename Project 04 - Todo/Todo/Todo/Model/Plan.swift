//
//  Plan.swift
//  Todo
//
//  Created by eunwoo on 2021/03/24.
//

import Foundation

struct Plan {
    let todo: String
    let location: String
    let date: String
    
    init(_ todo: String, _ location: String, _ date: String) {
        self.todo = todo
        self.location = location
        self.date = date
    }
}
