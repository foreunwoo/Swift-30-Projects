//
//  HomeVC.swift
//  AnimalSearch
//
//  Created by eunwoo on 2021/03/29.
//

import UIKit
import SnapKit
import Then

class HomeVC: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let animalsTableView = UITableView()
    
    let animalList = [["고양이", "포유류"], ["뱀", "파충류"],
                      ["개", "포유류"], ["물수리", "조류"],
                      ["염소", "포유류"], ["딱따구리", "조류"],
                      ["말", "포유류"], ["딱새", "조류"],
                      ["원숭이", "포유류"], ["청둥오리", "조류"],
                      ["코끼리", "포유류"], ["왜가리", "조류"],
                      ["기린", "포유류"], ["타조", "조류"],
                      ["개구리", "양서류"],["도룡뇽", "양서류"],
                      ["두꺼비", "양서류"], ["맹꽁이", "양서류"],
                      ["도마뱀", "파충류"], ["거북이", "파충류"],
                      ["악어", "파충류"],]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        setSearchController()
        setTableView()
    }
    
    func setSearchController() {
        searchController.searchBar.placeholder = "Search animals"
        searchController.searchBar.scopeButtonTitles = [ "포유류", "양서류", "파충류", "조류" ]
        
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Animals"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    func setTableView() {
        _ = animalsTableView.then {
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(AnimalsTVCell.self, forCellReuseIdentifier: "AnimalsTVCell")
            
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
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalsTVCell", for: indexPath) as! AnimalsTVCell
        cell.selectionStyle = .none
        
        cell.animal = Animal(animalList[indexPath.row][0], animalList[indexPath.row][1])
        cell.fillDataToView()
        
        return cell
    }
    
    
}
