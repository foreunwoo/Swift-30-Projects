//
//  LoginVC.swift
//  EunhasuChat
//
//  Created by eunwoo on 2021/06/05.
//

import UIKit
import SnapKit
import Then

class LoginVC: UIViewController {
    
    let logoLabel = UILabel().then {
        $0.text = "EunhasuChat"
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = .systemBlue
    }
    
    let idTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        
        $0.placeholder = "아이디를 입력해 주세요"
        $0.font = .systemFont(ofSize: 13)
    }
    let pwTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        
        $0.placeholder = "비밀번호를 입력해 주세요"
        $0.font = .systemFont(ofSize: 13)
    }
    
    let loginButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .lightGray
        
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
    }
    let signUpButton = UIButton().then {
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        makeConstraints()
    }
    
    func makeConstraints() {
        view.backgroundColor = .white
        
        view.addSubview(logoLabel)
        
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
        
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        
        logoLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(120)
            $0.left.equalTo(view.snp.left).offset(40)
            $0.right.equalTo(view.snp.right).inset(40)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.left.equalTo(idTextField.snp.left)
            $0.right.equalTo(idTextField.snp.right)
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(40)

            $0.top.equalTo(pwTextField.snp.bottom).offset(60)
            $0.left.equalTo(pwTextField.snp.left)
            $0.right.equalTo(pwTextField.snp.right)
        }
        signUpButton.snp.makeConstraints {
            $0.height.equalTo(40)

            $0.top.equalTo(loginButton.snp.bottom).offset(80)
            $0.left.equalTo(loginButton.snp.left)
            $0.right.equalTo(loginButton.snp.right)
        }
    }

}
