//
//  LogOutTVCell.swift
//  FacebookMe
//
//  Created by eunwoo on 2021/03/20.
//

import UIKit

class LogOutTVCell: MenuTVCell {

    override func makeConstraints() {
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(contentView)
            $0.centerY.equalTo(contentView)
        }
    }
    
    override func fillDataToView() {
        
        _ = titleLabel.then {
            $0.text = menuList[0]
            $0.textColor = .red
        }
    }

}
