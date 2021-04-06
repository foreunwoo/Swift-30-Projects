//
//  MainFeedTVCell.swift
//  EunwooBird
//
//  Created by eunwoo on 2021/04/06.
//

import UIKit
import SnapKit
import Then

class MainFeedTVCell: UITableViewCell {

    let profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 58, height: 58))
    let nicknameLabel = UILabel()
    
    let moreButton = UIButton()
    
    let contentTextView = UITextView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .birdNavy
        
        initCell()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initCell() {
        _ = profileImageView.then {
            $0.image = UIImage(named: "cat.jpeg")
            $0.layer.cornerRadius = 0.5 * profileImageView.frame.size.width
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        _ = nicknameLabel.then {
            $0.text = "닉네임"
            $0.font = .boldSystemFont(ofSize: 15)
            $0.textColor = .white
            
            $0.sizeToFit()
        }
        
        _ = moreButton.then {
            $0.contentHorizontalAlignment = .left
            $0.setImage(UIImage(systemName: "ellipsis"), for: .normal)
            $0.tintColor = .lightGray
        }
        
        _ = contentTextView.then {
            $0.text = "어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구"
            $0.font = .systemFont(ofSize: 15)
            $0.isScrollEnabled = false
            
            $0.textContainer.lineFragmentPadding = 0
            $0.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
            $0.backgroundColor = .birdNavy
            $0.textColor = .white
        }
    }
    
    func makeConstraints() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nicknameLabel)
        
        contentView.addSubview(moreButton)
        
        contentView.addSubview(contentTextView)
        
        profileImageView.snp.makeConstraints {
            $0.width.equalTo(58)
            $0.height.equalTo(profileImageView.snp.width).priority(999)
            
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.left.equalTo(contentView.snp.left).inset(10)
        }
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.left.equalTo(profileImageView.snp.right).inset(-10)
        }
        
        moreButton.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(moreButton.snp.width)
            
            $0.centerY.equalTo(nicknameLabel)
            $0.right.equalTo(contentView.snp.right).offset(10)
        }
        
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(5)
            $0.left.equalTo(nicknameLabel.snp.left)
            $0.right.equalTo(contentView.snp.right).offset(-10)
            $0.bottom.equalTo(contentView.snp.bottom).inset(10)
        }
    }
}
