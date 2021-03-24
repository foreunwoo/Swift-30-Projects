//
//  TodoListTVCell.swift
//  Todo
//
//  Created by eunwoo on 2021/03/23.
//

import UIKit
import SnapKit
import Then

class TodoListTVCell: UITableViewCell {
    
    let todoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.numberOfLines = 5
        $0.textAlignment = .center
        $0.text = "Meeting"
    }
    let locationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.numberOfLines = 5
        $0.textAlignment = .center
        $0.text = "650 Castro St, Mountain View"
    }
    let dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.text = "03/23/2021"
    }
    
    var plan: Plan?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        contentView.addSubview(todoLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(dateLabel)
        
        todoLabel.snp.makeConstraints {
            let width = UIScreen.main.bounds.size.width

            $0.width.equalTo(width / 3)
            
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        locationLabel.snp.makeConstraints {
            let width = UIScreen.main.bounds.size.width

            $0.width.equalTo(width / 3)
            
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(todoLabel.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        dateLabel.snp.makeConstraints {
            let width = UIScreen.main.bounds.size.width

            $0.width.equalTo(width / 3)
            
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(locationLabel.snp.right)
            $0.right.equalTo(contentView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    func fillDataToView() {
        todoLabel.text = plan?.todo
        locationLabel.text = plan?.location
        dateLabel.text = plan?.date
    }
    
}
