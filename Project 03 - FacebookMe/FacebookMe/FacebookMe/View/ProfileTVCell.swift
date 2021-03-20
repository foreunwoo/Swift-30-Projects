//
//  ProfileTVCell.swift
//  FacebookMe
//
//  Created by eunwoo on 2021/03/20.
//

import UIKit
import SnapKit
import Then

class ProfileTVCell: MenuTVCell {
    
    let viewLabel = UILabel().then {
        $0.text = "View my profile"
        $0.font = .systemFont(ofSize: 13)
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        
        contentView.addSubview(viewLabel)
        
        viewLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.left.equalTo(titleLabel.snp.left)
        }
    }
    
    override func fillDataToView() {
        _ = titleImageView.then {
            $0.image = UIImage(named: menuList[1])
            
            $0.snp.updateConstraints {
                $0.height.equalTo(100).priority(999)
                $0.width.equalTo(100)
                
                $0.top.equalTo(contentView.snp.top)
                $0.bottom.equalTo(contentView.snp.bottom)
            }
        }
        
        _ = titleLabel.then {
            $0.text = menuList[0]
        }
    }

}
