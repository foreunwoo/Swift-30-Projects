//
//  ContryTVCell.swift
//  ExpandingCell
//
//  Created by eunwoo on 2021/05/09.
//

import UIKit
import SnapKit
import Then

class ContryTVCell: UITableViewCell {
    
    let nameLabel = UILabel().then {
        $0.text = "대한민국"
        $0.font = .boldSystemFont(ofSize: 20)
    }
    let flagImageView = UIImageView().then {
        $0.image = UIImage(named: "Korea.png")
    }
    let informationTextView = UITextView().then {
        $0.text = "이제 동적으로 높이 설정이 되도록 세팅을 했다면 실제로 Expanded 값이 바뀌었을 때 Cell 에서 어떻게 높이가 바뀌어야 하는지 설정해줘야합니다. 코드로 하는 방법도 있지만 저는 스토리보드에서 확장되고자 하는 컨텐츠에 대해서 높이에 대한 NSLayoutConstraint 을 선언해서 동적으로 변하는 방법을 사용했습니다!"
        $0.isEditable = false
    }
    
    let arrowButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        $0.setImage(UIImage(systemName: "chevron.up"), for: .selected)
        
        $0.tintColor = .lightGray
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        contentView.addSubview(nameLabel)
        
        contentView.addSubview(arrowButton)
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.left.equalTo(contentView.snp.left).inset(10)
        }
        
        arrowButton.snp.makeConstraints {
            $0.width.equalTo(18)
            $0.height.equalTo(18)
            
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.right.equalTo(contentView.snp.right).offset(-10)
        }
    }
    
}
