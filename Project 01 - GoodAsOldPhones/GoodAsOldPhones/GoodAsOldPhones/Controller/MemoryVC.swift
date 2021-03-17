//
//  MemoryVC.swift
//  GoodAsOldPhones
//
//  Created by eunwoo on 2021/03/16.
//

import UIKit
import SnapKit
import Then

class MemoryVC: UIViewController {
    
    let memoryTableView = UITableView()
    
    var list = [["skhu-logo.jpg", "Skhu univ"],
                ["swift-og.png", "Studying swift"],
                ["Apple-logo.png", "I want to be a iOS developer"],
                ["Cat.jpg", "Live with a cat"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)

        setTableView()
    }
    
    func setTableView() {
        _ = memoryTableView.then {
            $0.backgroundColor = .white
            
            $0.register(MemoryTVCell.self, forCellReuseIdentifier: Identify.MemoryTVCell)
            
            $0.delegate = self
            $0.dataSource = self
        }
        
        view.addSubview(memoryTableView)
        
        memoryTableView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.left.equalTo(view.snp.left)
            $0.right.equalTo(view.snp.right)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }

}

extension MemoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identify.MemoryTVCell, for: indexPath) as! MemoryTVCell
        cell.selectionStyle = .none
        
        cell.memoryImageView.image = UIImage(named: list[indexPath.row][0])
        cell.titleLabel.text = list[indexPath.row][1]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.titleImageView.image = UIImage(named: list[indexPath.row][0])
        detailVC.titleLabel.text = list[indexPath.row][1]
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

class MemoryTVCell: UITableViewCell {
    
    static let identifier = Identify.MemoryTVCell
    
    let memoryImageView = UIImageView()
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.text = "라벨입니다ㅁㅁㅁㅁ"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        contentView.addSubview(memoryImageView)
        contentView.addSubview(titleLabel)
        
        memoryImageView.snp.makeConstraints {
            $0.width.equalTo(60)
            $0.height.lessThanOrEqualTo(60).priority(999)
            
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(memoryImageView.snp.right).offset(10)
            $0.centerY.equalTo(memoryImageView)
        }
    }
}
