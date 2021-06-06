//
//  SignUpVC.swift
//  EunhasuChat
//
//  Created by eunwoo on 2021/06/06.
//

import UIKit
import Firebase

class SignUpVC: LoginVC {
    
    var loginVC: LoginVC?

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }
    
    func setLayout() {
        _ = emailTextField.then {
            $0.placeholder = "이메일을 입력해 주세요"
        }
        
        _ = loginButton.then {
            $0.setTitle("회원가입", for: .normal)
            
            $0.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        }
        
        _ = signUpButton.then {
            $0.setTitleColor(.none, for: .normal)
            $0.isUserInteractionEnabled = false
        }
    }

    override func didTapSignUpButton() {
        Auth.auth().createUser(withEmail: emailTextField.text ?? "", password: pwTextField.text ?? ""
        ) { (user, error) in
            if user !=  nil {
                self.dismiss(animated: true, completion: .none)
            }
            else{
                print(error!)
                
                self.makeAlertDialog(title: "회원가입 실패", message: "이메일과 비밀번호를 다시 한 번 확인해 주세요")
            }
        }
    }
    
    func makeAlertDialog(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let confirmButton = UIAlertAction(title: "확인", style: .default, handler: .none)
        
        alert.addAction(confirmButton)
        
        self.present(alert, animated: true, completion: nil)
    }
}
