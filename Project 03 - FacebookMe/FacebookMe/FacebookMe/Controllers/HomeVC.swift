//
//  HomeVC.swift
//  FacebookMe
//
//  Created by eunwoo on 2021/03/19.
//

import UIKit
import SnapKit
import Then

class HomeVC: UIViewController {
    
    let menuTableView = UITableView(frame: .zero, style: .grouped)
    
    let sections = [" ","Favorites"," "]
    
    var menues = [["Friends", "person.2.fill"],
                    ["Events", "calendar"],
                    ["Groups", "person.3.fill"],
                    ["CMU", "graduationcap.fill"],
                    ["Town Hall", "house.fill"],
                    ["Instant Games", "gamecontroller.fill"],
                    ["See More...", ""]]
    
    var settings = [["Settings", "gearshape"],
                    ["Privacy Shortcuts", "lock.fill"],
                    ["Help and Support", "questionmark.circle.fill"],]
        

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.navigationItem.title = "Facebook"
        self.navigationController?.navigationBar.barTintColor = .facebookBlue
        
        setTableView()
    }
    
    func setTableView() {
        _ = menuTableView.then {
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(MenuTVCell.self, forCellReuseIdentifier: Identify.MenuTVCell)
            
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menues.count
        case 1:
            return 1
        case 2:
            return settings.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTVCell", for: indexPath) as! MenuTVCell
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            cell.menuList[0] = menues[indexPath.row][0]
            cell.menuList[1] = menues[indexPath.row][1]
        case 1:
            cell.menuList[0] = "Add Favorites..."
        case 2:
            cell.menuList[0] = settings[indexPath.row][0]
            cell.menuList[1] = settings[indexPath.row][1]
        default:
            return UITableViewCell()
        }
        
        cell.fillDataToView()
        
        return cell
    }
    
    
}
