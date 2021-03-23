//
//  InputVC.swift
//  Todo
//
//  Created by eunwoo on 2021/03/23.
//

import UIKit
import SnapKit
import Then

class InputVC: UIViewController {
    
    let textFieldContainerView = UIView()
    
    let todoTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 15)
        $0.borderStyle = .roundedRect
    }
    let locationTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 15)
        $0.borderStyle = .roundedRect
    }
    let dateTextField = UITextField().then {
        $0.font = .systemFont(ofSize: 15)
        $0.borderStyle = .roundedRect
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeConstraints()
    }
    
    func makeConstraints() {
        view.backgroundColor = .white
        
        view.addSubview(textFieldContainerView)
        
        textFieldContainerView.addSubview(todoTextField)
        textFieldContainerView.addSubview(locationTextField)
        textFieldContainerView.addSubview(dateTextField)
        
        textFieldContainerView.snp.makeConstraints {
            $0.height.equalTo(150)
            
            $0.top.equalTo(view.snp.top).offset(150)
            $0.left.equalTo(view.snp.left).inset(50)
            $0.right.equalTo(view.snp.right).inset(50)
        }
        textFieldContainerView.backgroundColor = .yellow
        
        todoTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.greaterThanOrEqualTo(200)
            $0.width.lessThanOrEqualTo(230)
            
            $0.top.equalTo(textFieldContainerView.snp.top).offset(10)
            $0.centerX.equalTo(textFieldContainerView)
        }
        locationTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            
            $0.top.equalTo(todoTextField.snp.bottom).offset(10)
            $0.left.equalTo(todoTextField.snp.left)
            $0.right.equalTo(todoTextField.snp.right)
        }
        dateTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            
            $0.top.equalTo(locationTextField.snp.bottom).offset(10)
            $0.left.equalTo(locationTextField.snp.left)
            $0.right.equalTo(locationTextField.snp.right)
        }
    }
}
