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
    
    var mainTimer: Timer?
    var timeCount = 0
    
    let labelContainerView = UIView()
    
    let timeLabel = UILabel().then {
        $0.text = "00:00"
        $0.font = .boldSystemFont(ofSize: 80)
    }
    let decimalSecLabel = UILabel().then {
        $0.text = ".0"
        $0.font = .systemFont(ofSize: 50)
    }
    
    let buttonContainerView = UIView()
    
    let lapOrResetButton = HighlightedButton().then {
        $0.setTitle("Lap", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.setTitleColor(.black, for: .normal)
    }
    let startOrStopButton = HighlightedButton().then {
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
        lapOrResetButton.addTarget(self, action: #selector(didTapLapOrResetButton), for: .touchUpInside)
        startOrStopButton.addTarget(self, action: #selector(didTapStartOrStopButton(_:)), for: .touchUpInside)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(labelContainerView)
        labelContainerView.addSubview(timeLabel)
        labelContainerView.addSubview(decimalSecLabel)
        
        contentView.addSubview(buttonContainerView)
        buttonContainerView.addSubview(lapOrResetButton)
        buttonContainerView.addSubview(startOrStopButton)
        
        labelContainerView.snp.makeConstraints {
            $0.height.equalTo(100).priority(999)
            $0.width.equalTo(270)
            
            $0.centerX.equalTo(contentView)
            $0.top.equalTo(contentView.snp.top).offset(50)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(labelContainerView.snp.top)
            $0.left.equalTo(labelContainerView.snp.left)
            $0.bottom.equalTo(labelContainerView.snp.bottom)
        }
        decimalSecLabel.snp.makeConstraints {
            $0.top.equalTo(labelContainerView.snp.top)
            $0.left.equalTo(timeLabel.snp.right)
            $0.right.equalTo(labelContainerView.snp.right)
            $0.bottom.equalTo(labelContainerView.snp.bottom).inset(-20)
        }
        
        buttonContainerView.snp.makeConstraints {
            $0.height.equalTo(80).priority(999)
            $0.width.equalTo(200)
            
            $0.centerX.equalTo(labelContainerView)
            $0.top.equalTo(labelContainerView.snp.bottom).offset(50)
            $0.bottom.equalTo(contentView.snp.bottom).inset(30)
        }
        
        lapOrResetButton.snp.makeConstraints {
            $0.width.equalTo(80)
            
            $0.top.equalTo(buttonContainerView.snp.top)
            $0.left.equalTo(buttonContainerView.snp.left)
            $0.bottom.equalTo(buttonContainerView.snp.bottom)
        }
        startOrStopButton.snp.makeConstraints {
            $0.width.equalTo(80)
            
            $0.top.equalTo(buttonContainerView.snp.top)
            $0.right.equalTo(buttonContainerView.snp.right)
            $0.bottom.equalTo(buttonContainerView.snp.bottom)
        }
    
    }
    
    @objc func didTapStartOrStopButton(_ sender: UIButton) {
        if !startOrStopButton.isSelected { // start 상태
            startOrStopButton.isSelected = true
            mainTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (_) in
                        self.timeCount += 1
                        DispatchQueue.main.async {
                            let timeString = self.makeTimeLabel(count: self.timeCount)
                            self.timeLabel.text = timeString.0
                            self.decimalSecLabel.text = ".\(timeString.1)"
                        }
                    })
            lapOrResetButton.setTitle("Lap", for: .normal)

        } else { // stop 상태
            startOrStopButton.isSelected = false
            mainTimer?.invalidate()
            mainTimer = nil
            
            lapOrResetButton.setTitle("Reset", for: .normal)
        }
        
    }
    
    func makeTimeLabel(count:Int) -> (String,String) {
        let decimalSec = count % 10
        let sec = (count / 10) % 60
        let min = (count / 10) / 60
        
        let sec_string = "\(sec)".count == 1 ? "0\(sec)" : "\(sec)"
        let min_string = "\(min)".count == 1 ? "0\(min)" : "\(min)"
        
        return ("\(min_string):\(sec_string)","\(decimalSec)")
    }
    
    @objc func didTapLapOrResetButton() {
        if lapOrResetButton.titleLabel?.text == "Reset" {
            mainTimer?.invalidate()
            mainTimer = nil
            timeCount = 0
            timeLabel.text = "00:00"
            decimalSecLabel.text = ".0"
            
            lapOrResetButton.setTitle("Lap", for: .normal)
            self.homeVC?.recordList.removeAll()
            self.homeVC?.recordTableView.reloadData()
            
        } else {
            if startOrStopButton.titleLabel?.text == "Stop" {
                let timeString = self.makeTimeLabel(count: self.timeCount)
                self.homeVC?.recordList.append("\(timeString.0).\(timeString.1)")
                self.homeVC?.recordTableView.reloadData()
            }
        }
    }


}
