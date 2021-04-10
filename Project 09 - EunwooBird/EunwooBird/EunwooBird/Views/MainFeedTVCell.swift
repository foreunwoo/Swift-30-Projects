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
    let idLabel = UILabel()
    let dateLabel = UILabel()
    
    let moreButton = UIButton()
    
    let contentTextView = UITextView()
    let contentImageView = UIImageView()
    
    let messageButton = UIButton()
    let retweetButton = UIButton()
    let likeButton = UIButton()
    let shareButton = UIButton()
    
    var twit: Twit?

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
        _ = idLabel.then {
            $0.text = "@foreunwoo"
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .lightGray
            
            $0.sizeToFit()
        }
        _ = dateLabel.then {
            $0.text = "‧ 5일"
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .lightGray
            
            $0.sizeToFit()
        }
        
        _ = moreButton.then {
            $0.setImage(UIImage(systemName: "ellipsis"), for: .normal)
            $0.tintColor = .lightGray
            $0.contentHorizontalAlignment = .fill
            
            $0.alpha = 0.7
        }
        
        _ = contentTextView.then {
            $0.text = "어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구 어쩌구저쩌구"
            $0.font = .systemFont(ofSize: 15)
            $0.isScrollEnabled = false
            $0.isUserInteractionEnabled = false
            
            $0.textContainer.maximumNumberOfLines = 3
            $0.textContainer.lineFragmentPadding = 0
            $0.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
            $0.backgroundColor = .birdNavy
            $0.textColor = .white
        }
        _ = contentImageView.then {
            $0.layer.cornerRadius = 10
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            
            $0.image = UIImage(named: "cat.jpeg")
        }
        
        _ = messageButton.then {
            $0.contentHorizontalAlignment = .left
            $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0)
            
            $0.setImage(UIImage(systemName: "message"), for: .normal)
            
            $0.tintColor = .lightGray
            
            $0.setTitle("73", for: .normal)
            $0.setTitleColor(.lightGray, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13)
        }
        _ = retweetButton.then {
            $0.contentHorizontalAlignment = .left
            $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0)
            
            $0.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
            
            $0.tintColor = .lightGray
            
            $0.setTitle("15.6k", for: .normal)
            $0.setTitleColor(.lightGray, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13)
        }
        _ = likeButton.then {
            $0.contentHorizontalAlignment = .left
            $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0)
            
            $0.setImage(UIImage(systemName: "heart"), for: .normal)
            $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)

            $0.tintColor = .lightGray
            
            $0.setTitle("13.2k", for: .normal)
            $0.setTitleColor(.lightGray, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13)
            
            //$0.addTarget(self, action: #selector(likeButtonDidTap(_:)), for: .touchUpInside)
        }
        _ = shareButton.then {
            $0.contentHorizontalAlignment = .left
            
            $0.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
            
            $0.tintColor = .lightGray
        }
    }
    
//    @objc func likeButtonDidTap(_ sender: UIButton) {
//        if likeButton.isSelected {
//            likeButton.isSelected = false
//            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
//            likeButton.tintColor = .lightGray
//        } else {
//            likeButton.isSelected = true
//            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
//            likeButton.tintColor = .systemPink
//        }
//    }
    
    func makeConstraints() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nicknameLabel)
        contentView.addSubview(idLabel)
        contentView.addSubview(dateLabel)
        
        contentView.addSubview(moreButton)
        
        contentView.addSubview(contentTextView)
        contentView.addSubview(contentImageView)
        
        contentView.addSubview(messageButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        
        profileImageView.snp.makeConstraints {
            $0.width.equalTo(58)
            $0.height.equalTo(profileImageView.snp.width)
            
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.left.equalTo(contentView.snp.left).inset(10)
        }
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.left.equalTo(profileImageView.snp.right).inset(-10)
        }
        idLabel.snp.makeConstraints {
            $0.width.equalTo(90)
            $0.height.equalTo(18)
            
            $0.left.equalTo(nicknameLabel.snp.right).inset(-5)
            $0.centerY.equalTo(nicknameLabel)
        }
        dateLabel.snp.makeConstraints {
            $0.left.equalTo(idLabel.snp.right).inset(-5)
            $0.centerY.equalTo(idLabel)
        }
        
        moreButton.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(moreButton.snp.width)
            
            $0.centerY.equalTo(dateLabel)
            $0.right.equalTo(contentView.snp.right).offset(-10)
        }
        
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(5)
            $0.left.equalTo(nicknameLabel.snp.left)
            $0.right.equalTo(contentView.snp.right).offset(-10)
        }
        contentImageView.snp.makeConstraints {
            $0.height.equalTo(170)
            
            $0.top.equalTo(contentTextView.snp.bottom).offset(10)
            $0.left.equalTo(contentTextView.snp.left)
            $0.right.equalTo(moreButton.snp.right)
        }
        
        messageButton.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(18)
            
            $0.top.equalTo(contentImageView.snp.bottom).offset(10)
            $0.left.equalTo(contentImageView.snp.left)
            $0.bottom.equalTo(contentView.snp.bottom).inset(10)
        }
        retweetButton.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(18)
            
            $0.left.equalTo(messageButton.snp.right)
            $0.centerY.equalTo(messageButton)
        }
        likeButton.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(18)
            
            $0.left.equalTo(retweetButton.snp.right)
            $0.centerY.equalTo(retweetButton)
        }
        shareButton.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(18)
            
            $0.left.equalTo(likeButton.snp.right)
            $0.centerY.equalTo(likeButton)
        }
    }
    
    func fillDataToView() { // 프로필, 닉네임, 날짜, 아이디, 내용, 사진, 메시지,리트윗,좋아요 카운트
        profileImageView.image = UIImage(named: twit?.profileImage ?? "")
    
        nicknameLabel.text = twit?.nickname
        dateLabel.text = "‧ \(String(describing: twit?.date ?? ""))"
        idLabel.text = twit?.id
        
        contentTextView.text = twit?.content
        if twit?.contentImage == "" {
            contentImageView.snp.updateConstraints {
                $0.height.equalTo(0)
                
                $0.top.equalTo(contentTextView.snp.bottom).offset(10)
                $0.left.equalTo(contentTextView.snp.left)
                $0.right.equalTo(moreButton.snp.right)
            }
        } else {
            contentImageView.image = UIImage(named: twit?.contentImage ?? "")
        }
        
        messageButton.setTitle(twit?.messageCount, for: .normal)
        retweetButton.setTitle(twit?.retweetCount, for: .normal)
        likeButton.setTitle(twit?.likeCount, for: .normal)

        if twit?.likeStatus == .isLiked {
            likeButton.isSelected = true
            likeButton.tintColor = .systemPink
        } else {
            likeButton.isSelected = false
            likeButton.tintColor = .lightGray
        }
    }
}
