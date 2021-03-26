//
//  HighlightedButton.swift
//  CustomFont
//
//  Created by eunwoo on 2021/03/26.
//

import UIKit

class HighlightedButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.5 : 1.0
        }
    }
    
}
