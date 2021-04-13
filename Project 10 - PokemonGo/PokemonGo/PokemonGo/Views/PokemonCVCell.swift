//
//  PokemonCVCell.swift
//  PokemonGo
//
//  Created by eunwoo on 2021/04/13.
//

import UIKit
import SnapKit
import Then

class PokemonCVCell: UICollectionViewCell {
    
    let monsterImageView = UIImageView().then {
        $0.image = UIImage(named: "이상해씨.png")
    }
    let nameLabel = UILabel().then {
        $0.text = "이상해씨"
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    let firstTypeButton = UIButton().then {
        $0.tintColor = .white
        $0.setTitle("풀", for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = .systemGreen
    }
    let secondTypeButton = UIButton().then {
        $0.tintColor = .white
        $0.setTitle("독", for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = .purple
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        contentView.addSubview(monsterImageView)
        contentView.addSubview(nameLabel)
        
        contentView.addSubview(firstTypeButton)
        contentView.addSubview(secondTypeButton)
        
        monsterImageView.snp.makeConstraints {
            $0.height.equalTo(100)
            
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(monsterImageView.snp.bottom).offset(5)
            $0.centerX.equalTo(monsterImageView)
        }
        
        firstTypeButton.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width / 6)
            
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.left.equalTo(monsterImageView.snp.left)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        secondTypeButton.snp.makeConstraints {
            $0.left.equalTo(firstTypeButton.snp.right)
            $0.right.equalTo(monsterImageView.snp.right)
            $0.centerY.equalTo(firstTypeButton)
        }
    }
}
