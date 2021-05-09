//
//  MainVC.swift
//  ExpandingCell
//
//  Created by eunwoo on 2021/05/09.
//

import UIKit
import SnapKit
import Then

class MainVC: UIViewController {
    
    let countryTableView = UITableView(frame: .zero, style: .insetGrouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "ExpandingCell"
        
        setTableView()
    }
    
    func setTableView() {
        _ = countryTableView.then {
            $0.dataSource = self
            $0.delegate = self
            
            $0.register(ContryTVCell.self, forCellReuseIdentifier: "ContryTVCell")
            
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

extension MainVC: UITableViewDelegate {
    
}

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContryTVCell", for: indexPath) as! ContryTVCell
        
        return cell
    }
    
}
