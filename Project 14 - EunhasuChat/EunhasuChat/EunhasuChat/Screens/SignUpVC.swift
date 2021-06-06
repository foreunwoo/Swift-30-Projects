//
//  SignUpVC.swift
//  EunhasuChat
//
//  Created by eunwoo on 2021/06/06.
//

import UIKit

class SignUpVC: LoginVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }
    
    func setLayout() {
        _ = loginButton.then {
            $0.setTitle("회원가입", for: .normal)
        }
        
        _ = signUpButton.then {
            $0.setTitleColor(.none, for: .normal)
            $0.isUserInteractionEnabled = false
        }
    }

}
