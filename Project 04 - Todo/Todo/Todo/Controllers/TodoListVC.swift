//
//  TodoListVC.swift
//  Todo
//
//  Created by eunwoo on 2021/03/23.
//

import UIKit
import SnapKit
import Then

class TodoListVC: UIViewController {
    
    let rightNavigationBarButton = UIButton()
    
    let todoListTableView = UITableView()
    
    var list: [Plan] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setTableView()
    }
    
    func setNavigationBar() {
        _ = rightNavigationBarButton.then {
            $0.setImage(UIImage(systemName: "plus"), for: .normal)

            $0.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightNavigationBarButton)
    }
    
    func setTableView() {
        _ = todoListTableView.then {
            
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(TodoListTVCell.self, forCellReuseIdentifier: Identify.TodoListTVCell)
            
            view.addSubview(todoListTableView)
            
            todoListTableView.snp.makeConstraints {
                $0.top.equalTo(view.snp.top)
                $0.left.equalTo(view.snp.left)
                $0.right.equalTo(view.snp.right)
                $0.bottom.equalTo(view.snp.bottom)
            }
        }
    }
    
    @objc func didTapAddButton() {
        let inputVC = InputVC()
        
        inputVC.todoListVC = self
        
        self.navigationController?.pushViewController(inputVC, animated: true)
    }

}

extension TodoListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identify.TodoListTVCell, for: indexPath) as! TodoListTVCell
        cell.selectionStyle = .none
        
        cell.plan = list[indexPath.row]
        cell.fillDataToView()
        
        return cell
    }
}
