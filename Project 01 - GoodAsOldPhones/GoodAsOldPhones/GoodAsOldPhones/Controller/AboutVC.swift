//
//  AboutVC.swift
//  GoodAsOldPhones
//
//  Created by eunwoo on 2021/03/16.
//

import UIKit
import Then
import SnapKit

class AboutVC: UIViewController {
    
    let scrollView = UIScrollView().then {
        $0.isPagingEnabled = false
    }
    
    let titleImageView = UIImageView().then {
        $0.image = UIImage(named: "castle.jpg")
    }
    
    let titleLabel = UILabel().then {
        $0.text = "About me"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 40)
    }
    let contentLabel = UILabel().then {
        $0.text = "My name is Eunwoo. \n I studying swift. \n I will be a great iOS developer. \n I am very cool and will surely be the best."
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 15)
        $0.numberOfLines = 4
    }
    
    let contactLabel = UILabel().then {
        $0.text = "Contact"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 40)
    }
    
    let numberLabel = UILabel().then {
        $0.text = "010-1234-1234"
        $0.font = .systemFont(ofSize: 15)
    }
    let emailLabel = UILabel().then {
        $0.text = "agasiya99@gmail.com"
        $0.font = .systemFont(ofSize: 15)
    }
    let gitLabel = UILabel().then {
        $0.text = "https://github.com/foreunwoo"
        $0.font = .systemFont(ofSize: 15)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        
        makeConstraints()
    }
    
    func makeConstraints() {
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.addSubview(titleImageView)
        
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(contentLabel)
        
        scrollView.addSubview(contactLabel)
        scrollView.addSubview(numberLabel)
        scrollView.addSubview(emailLabel)
        scrollView.addSubview(gitLabel)
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.left.equalTo(view.snp.left)
            $0.right.equalTo(view.snp.right)
            $0.bottom.equalTo(view.snp.bottom)
        }
        
        titleImageView.snp.makeConstraints {
            $0.height.equalTo(200)
            
            $0.top.equalTo(scrollView.snp.top).offset(30)
            $0.left.equalTo(view.snp.left)
            $0.right.equalTo(view.snp.right)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(titleImageView.snp.bottom).offset(100)
            $0.centerX.equalTo(titleImageView)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.left.equalTo(titleLabel.snp.left)
            $0.right.equalTo(titleLabel.snp.right)
        }
        
        contactLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(100)
            $0.left.equalTo(contentLabel.snp.left)
            $0.right.equalTo(contentLabel.snp.right)
        }
        numberLabel.snp.makeConstraints {
            $0.top.equalTo(contactLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(contactLabel)
        }
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(numberLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(numberLabel)
        }
        gitLabel.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(emailLabel)
            $0.bottom.equalTo(scrollView.snp.bottom).inset(100)
        }
    }
}
