//
//  HomeVC.swift
//  CustomFont
//
//  Created by eunwoo on 2021/03/26.
//

import UIKit
import Then
import SnapKit

class HomeVC: UIViewController {
    
    let customTextView = UITextView().then {
        $0.text = "Welcome to eunwoo world \n We can do it"
        $0.textAlignment = .center
        $0.layer.borderWidth = 0.5
        $0.sizeToFit()
        $0.translatesAutoresizingMaskIntoConstraints = true
        $0.isScrollEnabled = false
    }
    
    let changeButton = HighlightedButton().then {
        $0.setTitle("Change Font", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        $0.isUserInteractionEnabled = true
    }
    
    let fonts = ["kefa", "papyrus", "zapfino", "bradleyHand"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Custom Font"
        
        makeConstraints()
    }

    func makeConstraints() {
        view.backgroundColor = .white
        
        changeButton.addTarget(self, action: #selector(didTapChangeButton), for: .touchUpInside)
        
        view.addSubview(customTextView)
        view.addSubview(changeButton)
        
        customTextView.snp.makeConstraints {
            $0.width.equalTo(250)
            $0.height.greaterThanOrEqualTo(40)
            
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view)
        }
        changeButton.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(40)
            
            $0.top.equalTo(customTextView.snp.bottom).offset(20)
            $0.centerX.equalTo(customTextView)
        }
    }
    
    @objc func didTapChangeButton() {
        if let font = fonts.randomElement() {
            customTextView.font = UIFont.init(name: font, size: 20)
        }
    }

}
