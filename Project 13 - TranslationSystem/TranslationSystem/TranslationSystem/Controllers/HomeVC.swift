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
    
    let originTextView = UITextView().then {
        $0.layer.borderWidth = 0.5
        
        $0.font = .systemFont(ofSize: 15)
        $0.text = "papago 번역은 비로그인 방식 오픈 API입니다. 비로그인 방식 오픈 API는 네이버 오픈API를 호출할 때 HTTP 요청 헤더에 클라이언트 아이디와 클라이언트 시크릿 값만 전송해 사용할 수 있는 오픈 API입니다. 클라이언트 아이디와 클라이언트 시크릿은 네이버 오픈API에서 인증된 사용자인지 확인하는 수단입니다. 네이버 개발자 센터에서 애플리케이션을 등록하면 클라이언트 아이디와 클라이언트 시크릿이 발급됩니다."
    }
    let translationButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)).then {
        $0.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
    }
    let translatedTextView = UITextView().then {
        $0.layer.borderWidth = 0.5
        
        $0.isEditable = false
        $0.font = .systemFont(ofSize: 15)
        $0.text = "애플리케이션 등록 (API이용신청) 페이지에서 애플리케이션 세부 정보를 입력하는 방법은 다음과 같습니다. 등록하려는 애플리케이션의 이름을 애플리케이션 이름에 입력합니다. 최대 40자까지 입력할 수 있습니다. 사용 API에서 Papago 번역을 선택해 추가합니다. 비로그인 오픈 API 서비스 환경에서 애플리케이션을 서비스할 환경을 추가하고 필요한 상세 정보를 입력합니다."
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationItem.title = "eunwoo's 번역기"
        
        makeConstraints()
    }
    
    func makeConstraints() {
        view.addSubview(originTextView)
        view.addSubview(translationButton)
        view.addSubview(translatedTextView)
        
        originTextView.snp.makeConstraints {
            $0.height.equalTo(150)
            
            $0.left.equalTo(view.snp.left).offset(10)
            $0.right.equalTo(view.snp.right).inset(10)
            $0.bottom.equalTo(translationButton.snp.top).offset(-15)
        }
        
        translationButton.snp.makeConstraints {
            $0.centerY.equalTo(view)
            $0.centerX.equalTo(originTextView)
        }
        
        translatedTextView.snp.makeConstraints {
            $0.height.equalTo(150)
            
            $0.top.equalTo(translationButton.snp.bottom).offset(15)
            $0.left.equalTo(originTextView.snp.left)
            $0.right.equalTo(originTextView.snp.right)
        }
    }
}
