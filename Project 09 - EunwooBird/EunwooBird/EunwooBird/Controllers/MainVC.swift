//
//  MainVC.swift
//  EunwooBird
//
//  Created by eunwoo on 2021/04/06.
//

import UIKit
import SnapKit
import Then

class MainVC: UIViewController {
    
    let mainFeedTableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .birdNavy
                
        setTableView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setTableView() {
        _ = mainFeedTableView.then {
            $0.backgroundColor = .birdNavy
            
            $0.separatorColor = .lightGray
            $0.separatorInset.left = 0
            
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(MainFeedTVCell.self, forCellReuseIdentifier: "MainFeedTVCell")
            
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

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainFeedTVCell", for: indexPath) as! MainFeedTVCell
        cell.selectionStyle = .none
        
        return cell
    }
}
