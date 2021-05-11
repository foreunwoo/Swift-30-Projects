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
        $0.font = .boldSystemFont(ofSize: 20)
    }
    let flagImageView = UIImageView()
    let informationTextView = UITextView().then {
        $0.font = .systemFont(ofSize: 15)
        
        $0.isEditable = false
        
        $0.sizeToFit()
        $0.translatesAutoresizingMaskIntoConstraints = true
        $0.isScrollEnabled = false
    }
    
    let arrowButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        $0.setImage(UIImage(systemName: "chevron.up"), for: .selected)
        
        $0.tintColor = .lightGray
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
            $0.top.equalTo(flagImageView.snp.bottom)
            $0.left.equalTo(flagImageView.snp.left)
            $0.right.equalTo(flagImageView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
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
            }
            
        } else {
            arrowButton.isSelected = false
            
            flagImageView.snp.updateConstraints {
                $0.height.equalTo(0)
            }
            
        }
    }
    
}
