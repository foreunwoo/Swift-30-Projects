//
//  Country.swift
//  ExpandingCell
//
//  Created by eunwoo on 2021/05/09.
//

import Foundation

struct Country {
    let name: String
    let flag: String
    let information: String
    var isExpanded: Bool
    
    init(name: String, flag: String, information: String, isExpanded: Bool) {
        self.name = name
        self.flag = flag
        self.information = information
        self.isExpanded = isExpanded
    }
}
