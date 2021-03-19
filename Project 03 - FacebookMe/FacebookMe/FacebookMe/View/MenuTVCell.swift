//
//  MenuTVCell.swift
//  FacebookMe
//
//  Created by eunwoo on 2021/03/19.
//

import UIKit
import SnapKit
import Then

class MenuTVCell: UITableViewCell {
    
    static let identifier = Identify.MenuTVCell
    
    var menuList = ["", ""]
    
    let titleImageView = UIImageView().then {
        $0.image = UIImage(systemName: "person.2.fill")
        $0.tintColor = .black
    }
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
        $0.text = "Friends"
    }
    let rightImageView = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.right")
        $0.tintColor = .lightGray
        $0.alpha = 0.5
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        contentView.addSubview(titleImageView)
        contentView.addSubview(titleLabel)
        
        contentView.addSubview(rightImageView)
        
        titleImageView.snp.makeConstraints {
            $0.height.equalTo(22).priority(999)
            $0.width.equalTo(24)
            
            $0.top.equalTo(contentView.snp.top).offset(15)
            $0.left.equalTo(contentView.snp.left).inset(15)
            $0.bottom.equalTo(contentView.snp.bottom).inset(15)
        }
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(titleImageView.snp.right).offset(15)
            $0.centerY.equalTo(titleImageView)
        }
        
        rightImageView.snp.makeConstraints {
            $0.height.equalTo(20).priority(999)
            $0.width.equalTo(15)
            
            $0.centerY.equalTo(titleLabel)
            $0.right.equalTo(contentView.snp.right).inset(15)
        }
    }
    
    func fillDataToView() {
        _ = titleImageView.then {
            $0.image = UIImage(systemName: menuList[1])
        }
        
        _ = titleLabel.then {
            $0.text = menuList[0]
            
            if menuList[1] == "" {
                $0.textColor = .facebookBlue
            }
        }
    }
    
}
