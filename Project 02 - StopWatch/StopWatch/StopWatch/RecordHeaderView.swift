//
//  RecordHeaderView.swift
//  StopWatch
//
//  Created by eunwoo on 2021/03/18.
//

import UIKit
import SnapKit
import Then

class RecordHeaderView: UITableViewHeaderFooterView {

    static let identifier = Identify.RecordHeaderView
    
    var homeVC: HomeVC?
    
    let timeLabel = UILabel().then {
        $0.text = "00:00.54"
        $0.font = .boldSystemFont(ofSize: 50)
    }
    
    let lapButton = UIButton().then {
        $0.setTitle("Lap", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.setTitleColor(.black, for: .normal)
    }
    let startButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        
        $0.setTitle("Start", for: .normal)
        $0.setTitleColor(.green, for: .normal)
        
        $0.setTitle("Stop", for: .selected)
        $0.setTitleColor(.red, for: .selected)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        startButton.addTarget(self, action: #selector(didTapStartButton(_:)), for: .touchUpInside)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(timeLabel)
        
        contentView.addSubview(lapButton)
        contentView.addSubview(startButton)
        
        timeLabel.snp.makeConstraints {
            $0.centerX.equalTo(contentView)
            $0.top.equalTo(contentView.snp.top).offset(40)
        }
        lapButton.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(50)
            $0.left.equalTo(timeLabel.snp.left)
            $0.bottom.equalTo(contentView.snp.bottom).inset(50)
        }
        startButton.snp.makeConstraints {
            $0.centerY.equalTo(lapButton)
            $0.left.equalTo(lapButton.snp.right).offset(80)
            $0.right.equalTo(timeLabel.snp.right).inset(20)
        }
    }
    
    @objc func didTapStartButton(_ sender: UIButton) {
        if !startButton.isSelected { // start 상태
            startButton.isSelected = true
        } else { // stop 상태
            startButton.isSelected = false
        }
        
    }

}
