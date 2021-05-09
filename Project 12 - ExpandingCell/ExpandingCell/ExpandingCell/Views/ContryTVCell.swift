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
        $0.font = .systemFont(ofSize: 15)
        
        $0.sizeToFit()
        $0.translatesAutoresizingMaskIntoConstraints = true
        $0.isScrollEnabled = false
        $0.isEditable = false
    }
    
    let arrowButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        $0.setImage(UIImage(systemName: "chevron.up"), for: .selected)
        
        $0.tintColor = .lightGray
        
        $0.isUserInteractionEnabled = true
    }
    
    var country: Country?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(flagImageView)
        contentView.addSubview(informationTextView)
        
        contentView.addSubview(arrowButton)
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.left.equalTo(contentView.snp.left).inset(10)
        }
        flagImageView.snp.makeConstraints {
            $0.height.equalTo(0)
            
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.left.equalTo(contentView.snp.left).offset(10)
            $0.right.equalTo(contentView.snp.right).inset(10)
        }
        informationTextView.snp.makeConstraints {
            $0.height.equalTo(0)
            
            $0.top.equalTo(flagImageView.snp.bottom).offset(10)
            $0.left.equalTo(flagImageView.snp.left)
            $0.right.equalTo(flagImageView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom).inset(10)
        }
        
        arrowButton.snp.makeConstraints {
            $0.width.equalTo(18)
            $0.height.equalTo(18)
            
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.right.equalTo(contentView.snp.right).inset(10)
        }
    }
    
    func fetchData() {
        nameLabel.text = country?.name
        flagImageView.image = UIImage(named: country?.flag ?? "")
        informationTextView.text = country?.information
        
        if country?.isExpanded ?? true {
            arrowButton.isSelected = true
            
            flagImageView.snp.updateConstraints {
                $0.height.equalTo(170)
                
                $0.top.equalTo(nameLabel.snp.bottom).offset(10)
                $0.left.equalTo(contentView.snp.left).offset(10)
                $0.right.equalTo(contentView.snp.right).inset(10)
            }
            
        } else {
            arrowButton.isSelected = false
            
            flagImageView.snp.updateConstraints {
                $0.height.equalTo(0)
                
                $0.top.equalTo(nameLabel.snp.bottom).offset(10)
                $0.left.equalTo(contentView.snp.left).offset(10)
                $0.right.equalTo(contentView.snp.right).inset(10)
            }
        }
    }
    
}
