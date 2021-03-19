//
//  HomeVC.swift
//  StopWatch
//
//  Created by eunwoo on 2021/03/18.
//

import UIKit
import SnapKit
import Then

class HomeVC: UIViewController {
    
    let recordTableView = UITableView()
    
    var recordList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.navigationItem.title = "StopWatch"
        
        setTableView()
    }
    
    func setTableView() {
        _ = recordTableView.then {
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(RecordHeaderView.self, forHeaderFooterViewReuseIdentifier: "RecordHeaderView")
            $0.register(RecordTVCell.self, forCellReuseIdentifier: "RecordTVCell")
            
            view.addSubview($0)
            
            $0.snp.makeConstraints {
                $0.top.equalTo(view.snp.top)
                $0.left.equalTo(view.snp.left)
                $0.right.equalTo(view.snp.right)
                $0.bottom.equalTo(view.snp.bottom)
            }
        }
        
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    // HeaderView
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 500
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identify.RecordHeaderView) as? RecordHeaderView
        headerView?.homeVC = self
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordTVCell") as! RecordTVCell
        cell.selectionStyle = .none
        
        cell.lapLabel.text = "Lap \(indexPath.row + 1)"
        cell.timeLabel.text = recordList[indexPath.row]
        
        return cell
    }
    
    
}

class RecordTVCell: UITableViewCell {
    
    static let identifier = Identify.RecordTVCell
    
    let lapLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20)
        $0.text = "Lap 12"
    }
    
    let timeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20)
        $0.text = "00:00.54"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        contentView.addSubview(lapLabel)
        contentView.addSubview(timeLabel)
        
        lapLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.left.equalTo(contentView.snp.left).inset(30)
            $0.bottom.equalTo(contentView.snp.bottom).inset(10)
        }
        
        timeLabel.snp.makeConstraints {
            $0.centerY.equalTo(lapLabel)
            $0.left.equalTo(lapLabel.snp.right)
            $0.right.equalTo(contentView.snp.right).inset(30)
        }
    }
}
