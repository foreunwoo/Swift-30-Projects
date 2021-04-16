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
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = .systemGreen
    }
    let secondTypeButton = UIButton().then {
        $0.tintColor = .white
        $0.setTitle("독", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = .purple
    }
    
    var monster: Monster?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
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
            $0.width.equalTo(UIScreen.main.bounds.width / 6 - 5)
            
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
    
    func fillDataToView() {
        monsterImageView.image = UIImage(named: "\(monster?.name ?? "").png")
        
        nameLabel.text = monster?.name
        
        firstTypeButton.backgroundColor = setBackgroundColor(type: monster?.oneType ?? "")
        firstTypeButton.setTitle(monster?.oneType, for: .normal)
                
        secondTypeButton.backgroundColor = setBackgroundColor(type: monster?.twoType ?? "")
        secondTypeButton.setTitle(monster?.twoType, for: .normal)
    }
    
    func setBackgroundColor(type: String) -> UIColor {
        var backgroundColor: UIColor
        
        switch type {
        case "풀":
            backgroundColor = .green
        case "벌레":
            backgroundColor = .systemGreen
        case "비행":
            backgroundColor = .systemBlue
        case "불꽃":
            backgroundColor = .systemOrange
        case "노말":
            backgroundColor = .systemGray
        case "물":
            backgroundColor = .blue
        case "페어리":
            backgroundColor = .systemPink
        case "전기":
            backgroundColor = .systemYellow
        case "땅":
            backgroundColor = .brown
        case "독":
            backgroundColor = .systemPurple
        case "강철":
            backgroundColor = .systemIndigo
        default:
            backgroundColor = .white
        }
        
        return backgroundColor
    }
}
