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
        
    var animalList = [Animal]()
    var filteredList = [Animal]()
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setSearchController()
        setTableView()
        
        setData()
    }
    
    func setSearchController() {
        searchController.searchBar.placeholder = "Search animals"
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Animals"
        self.navigationItem.hidesSearchBarWhenScrolling = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setTableView() {
        _ = animalsTableView.then {
            $0.delegate = self
            $0.dataSource = self
                        
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
        animalList.append(Animal("고양이", .a))
        animalList.append(Animal("개", .a))
        animalList.append(Animal("염소", .a))
        animalList.append(Animal("말", .a))
        animalList.append(Animal("원숭이", .a))
        animalList.append(Animal("코끼리", .a))
        animalList.append(Animal("기린", .a))
        
        animalList.append(Animal("개구리", .b))
        animalList.append(Animal("두꺼비", .b))
        animalList.append(Animal("도룡뇽", .b))
        animalList.append(Animal("맹꽁이", .b))
        
        animalList.append(Animal("뱀", .c))
        animalList.append(Animal("도마뱀", .c))
        animalList.append(Animal("거북이", .c))
        animalList.append(Animal("악어", .c))
        
        animalList.append(Animal("물수리", .d))
        animalList.append(Animal("딱따구리", .d))
        animalList.append(Animal("딱새", .d))
        animalList.append(Animal("청둥오리", .d))
        animalList.append(Animal("왜가리", .d))
        animalList.append(Animal("타조", .d))
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
        return isFiltering ? filteredList.count : animalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        cell.selectionStyle = .none
        
        if isFiltering {
            cell.textLabel?.text = filteredList[indexPath.row].name
            cell.detailTextLabel?.text = filteredList[indexPath.row].type.rawValue
        } else {
            cell.textLabel?.text = animalList[indexPath.row].name
            cell.detailTextLabel?.text = animalList[indexPath.row].type.rawValue
        }
        
        return cell
    }
}

extension HomeVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredList = animalList.filter({ (animal:Animal) -> Bool in
            return animal.name.lowercased().contains(searchController.searchBar.text!.lowercased())
        })
        
        self.animalsTableView.reloadData()
    }
}
