//
//  VideoTVCell.swift
//  PlayLocalVideo
//
//  Created by eunwoo on 2021/04/01.
//

import UIKit
import SnapKit

class VideoTVCell: UITableViewCell {
    
    let preImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initCell() {
        contentView.addSubview(preImageView)
        
        preImageView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
}
