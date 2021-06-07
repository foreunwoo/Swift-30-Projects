//
//  LoginVC.swift
//  EunhasuChat
//
//  Created by eunwoo on 2021/06/05.
//

import UIKit
import SnapKit
import Then
import Firebase

class LoginVC: UIViewController {
    
    let logoLabel = UILabel().then {
        $0.text = "EunhasuChat"
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = .systemBlue
    }
    
    let emailTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        
        $0.placeholder = "아이디를 입력해 주세요"
        $0.font = .systemFont(ofSize: 13)
    }
    let pwTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        
        $0.placeholder = "비밀번호를 입력해 주세요"
        $0.font = .systemFont(ofSize: 13)
        $0.isSecureTextEntry = true
    }
    
    let loginButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .lightGray
        
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        
        $0.isUserInteractionEnabled = true
        
        $0.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    let signUpButton = UIButton().then {
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        
        $0.isUserInteractionEnabled = true
        
        $0.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        makeConstraints()
    }
    
    func makeConstraints() {
        view.backgroundColor = .white
        
        view.addSubview(logoLabel)
        
        view.addSubview(emailTextField)
        view.addSubview(pwTextField)
        
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        
        logoLabel.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(120)
            $0.left.equalTo(view.snp.left).offset(40)
            $0.right.equalTo(view.snp.right).inset(40)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.left.equalTo(emailTextField.snp.left)
            $0.right.equalTo(emailTextField.snp.right)
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
    
    @objc func didTapLoginButton() {
        let email = "\(emailTextField.text ?? "")@gmail.com"
        
        Auth.auth().signIn(withEmail: email, password: pwTextField.text ?? "") { (user, error) in
            if user != nil{
                print("login success")
            }
            else{
                print(error!)
            }
        }
    }
    
    @objc func didTapSignUpButton() {
        let signUpVC = SignUpVC()
        
        signUpVC.loginVC = self
                
        present(signUpVC, animated: true, completion: .none)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
