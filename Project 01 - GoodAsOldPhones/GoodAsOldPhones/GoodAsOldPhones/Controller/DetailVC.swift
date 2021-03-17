//
//  DetailVC.swift
//  GoodAsOldPhones
//
//  Created by eunwoo on 2021/03/17.
//

import UIKit
import SnapKit
import Then

class DetailVC: UIViewController {
    
    let titleImageView = UIImageView()
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.text = "어쩌구저쩌구 샬라샬라 어쩌구 저쩌구 샬라샬라"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        makeConstraints()
    }
    
    func makeConstraints() {
        view.backgroundColor = .white
        view.addSubview(titleImageView)
        view.addSubview(titleLabel)
        
        titleImageView.snp.makeConstraints {
            $0.height.equalTo(300)
            
            $0.top.equalTo(view.snp.top).offset(100)
            $0.left.equalTo(view.snp.left).offset(30)
            $0.right.equalTo(view.snp.right).inset(30)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(titleImageView.snp.bottom).offset(10)
            $0.centerX.equalTo(view)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
}
