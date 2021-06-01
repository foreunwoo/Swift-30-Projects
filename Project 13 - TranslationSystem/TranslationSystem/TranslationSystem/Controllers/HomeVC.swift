//
//  HomeVC.swift
//  TranslationSystem
//
//  Created by eunwoo on 2021/05/27.
//

import UIKit
import SnapKit
import Then

class HomeVC: UIViewController {
    
    let sourceTextView = UITextView().then {
        $0.layer.borderWidth = 0.5
        
        $0.font = .systemFont(ofSize: 15)
        $0.text = "papago 번역은 비로그인 방식 오픈 API입니다. 비로그인 방식 오픈 API는 네이버 오픈API를 호출할 때 HTTP 요청 헤더에 클라이언트 아이디와 클라이언트 시크릿 값만 전송해 사용할 수 있는 오픈 API입니다. 클라이언트 아이디와 클라이언트 시크릿은 네이버 오픈API에서 인증된 사용자인지 확인하는 수단입니다. 네이버 개발자 센터에서 애플리케이션을 등록하면 클라이언트 아이디와 클라이언트 시크릿이 발급됩니다."
    }
    let sourceLanguageTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        
        $0.font = .systemFont(ofSize: 15)
        $0.placeholder = "원본 언어 입력(간체/번체 구분 필요)"
    }
        
    let translationButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)).then {
        $0.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        
        $0.isUserInteractionEnabled = true
        
        $0.addTarget(self, action: #selector(didTapTranslationButton), for: .touchUpInside)
    }
    
    let targetTextView = UITextView().then {
        $0.layer.borderWidth = 0.5
        
        $0.isEditable = false
        $0.font = .systemFont(ofSize: 15)
    }
    let targetLanguageTextField = UITextField().then {
        $0.borderStyle = .roundedRect

        $0.font = .systemFont(ofSize: 15)
        $0.placeholder = "목적 언어 입력(간체/번체 구분 필요)"
        $0.text = ""
    }
    
    var response: Response?
    
    var dic : [String : String] = ["한국어":"ko", "영어":"en", "일본어":"ja", "중국어 간체":"zh-CN", "중국어 번체":"zh-TW", "베트남어":"vi", "인도네시아어":"id", "태국어":"th", "독일어":"de", "러시아어":"ru", "스페인어":"es", "이탈리아어":"it", "프랑스어":"fr"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationItem.title = "eunwoo's 번역기"
        
        makeConstraints()
    }
    
    func makeConstraints() {
        view.addSubview(sourceTextView)
        view.addSubview(sourceLanguageTextField)
        
        view.addSubview(translationButton)
        
        view.addSubview(targetTextView)
        view.addSubview(targetLanguageTextField)
        
        sourceLanguageTextField.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(90)
            $0.width.lessThanOrEqualTo(sourceTextView.snp.width)
            
            $0.left.equalTo(view.snp.left).offset(10)
            $0.bottom.equalTo(sourceTextView.snp.top).offset(-10)
        }
        sourceTextView.snp.makeConstraints {
            $0.height.equalTo(150)
            
            $0.left.equalTo(sourceLanguageTextField)
            $0.right.equalTo(view.snp.right).inset(10)
            $0.bottom.equalTo(translationButton.snp.top).offset(-15)
        }
        
        translationButton.snp.makeConstraints {
            $0.centerY.equalTo(view)
            $0.centerX.equalTo(sourceTextView)
        }
        
        targetLanguageTextField.snp.makeConstraints {
            $0.width.greaterThanOrEqualTo(90)
            $0.width.lessThanOrEqualTo(targetTextView.snp.width)
            
            $0.top.equalTo(translationButton.snp.bottom).offset(15)
            $0.left.equalTo(view.snp.left).offset(10)
        }
        targetTextView.snp.makeConstraints {
            $0.height.equalTo(150)
            
            $0.top.equalTo(targetLanguageTextField.snp.bottom).offset(10)
            $0.left.equalTo(sourceTextView.snp.left)
            $0.right.equalTo(sourceTextView.snp.right)
        }
    }
    
    @objc func didTapTranslationButton() {
        postTranslateService(source: dic[self.sourceLanguageTextField.text ?? ""] ?? "", target: dic[self.targetLanguageTextField.text ?? ""] ?? "", text: self.sourceTextView.text, completionHandler: {
            self.targetTextView.text = self.response?.message.result.translatedText
        })
    }
    
    func makeAlertDialog(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
       
        let confirmButton = UIAlertAction(title: "확인", style: .default, handler: .none)
        
        alert.addAction(confirmButton)
       
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Server connect

extension HomeVC {
    func postTranslateService(source: String, target: String, text: String, completionHandler: @escaping () -> Void ) {
        TranslationService.shared.postTranslate(source, target, text) { (responsedata) in
            switch responsedata {
            case .success(let res):
                self.response = res as? Response
                completionHandler()
                
            case .requestErr(let message):
                self.makeAlertDialog(title: "번역 실패", message: "\(message)")
                print("request error")
                
            case .pathErr:
                self.makeAlertDialog(title: "번역 실패", message: "지원하지 않는 언어입니다")
                print(".pathErr")
                
            case .serverErr:
                self.makeAlertDialog(title: "번역 실패", message: "서버에 오류가 있습니다")
                print(".serverErr")
                
            case .networkFail :
                self.makeAlertDialog(title: "번역 실패", message: "네트워크에 오류가 있습니다")
                print("failure")
            }
        }
    }
}
