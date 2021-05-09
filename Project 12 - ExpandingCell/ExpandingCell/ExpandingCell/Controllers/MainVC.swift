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
    
    var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "ExpandingCell"
        
        setTableView()
        setData()
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
    
    func setData() {
        countries.append(Country(name: "대한민국", flag: "Korea.png", information: "", isExpanded: false))
        countries.append(Country(name: "인도", flag: "India.png", information: "", isExpanded: false))
        countries.append(Country(name: "태국", flag: "Thailand.png", information: "", isExpanded: false))
        
        countries.append(Country(name: "프랑스", flag: "France.png", information: "", isExpanded: false))
        countries.append(Country(name: "이탈리아", flag: "Italia.png", information: "", isExpanded: false))
        countries.append(Country(name: "영국", flag: "Uk.png", information: "", isExpanded: false))
        
        countries.append(Country(name: "케냐", flag: "Kenya.png", information: "", isExpanded: false))
        countries.append(Country(name: "가나", flag: "Ghana.png", information: "", isExpanded: false))
    }

}

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countries[indexPath.row].isExpanded = !countries[indexPath.row].isExpanded
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContryTVCell", for: indexPath) as! ContryTVCell
        
        cell.selectionStyle = .none
        cell.country = countries[indexPath.row]
        cell.fetchData()
        
        return cell
    }
    
}
