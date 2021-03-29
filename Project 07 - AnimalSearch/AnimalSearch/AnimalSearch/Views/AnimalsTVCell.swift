//
//  AnimalsTVCell.swift
//  AnimalSearch
//
//  Created by eunwoo on 2021/03/29.
//

import UIKit
import SnapKit
import Then

class AnimalsTVCell: UITableViewCell {
    
    static let identifier = Identify.AnimalsTVCell
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
        $0.text = "고양이"
    }
    let typeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
        $0.text = "포유류"
    }
    
    var animal: Animal?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(typeLabel)
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.left.equalTo(contentView.snp.left).offset(20)
        }
        typeLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.left.equalTo(nameLabel.snp.left)
            $0.bottom.equalTo(contentView.snp.bottom).inset(5)
        }
    }
    
    func fillDataToView() {
        nameLabel.text = animal?.name ?? ""
        typeLabel.text = animal?.type ?? ""
    }
    
}
