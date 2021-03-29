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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        setSearchController()
    }
    
    func setSearchController() {
        searchController.searchBar.placeholder = "Search animals"
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Animals"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }

}
