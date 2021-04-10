//
//  MainVC.swift
//  EunwooBird
//
//  Created by eunwoo on 2021/04/06.
//

import UIKit
import SnapKit
import Then

class MainVC: UIViewController {
    
    let mainFeedTableView = UITableView(frame: .zero, style: .plain)
    
    var twits: [Twit] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .birdNavy
                
        setTableView()
        setData()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setTableView() {
        _ = mainFeedTableView.then {
            $0.backgroundColor = .birdNavy
            
            $0.separatorColor = .lightGray
            $0.separatorInset.left = 0
            
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(MainFeedTVCell.self, forCellReuseIdentifier: "MainFeedTVCell")
            
            view.addSubview($0)
            
            $0.snp.makeConstraints {
                $0.top.equalTo(view.snp.top)
                $0.left.equalTo(view.snp.left)
                $0.right.equalTo(view.snp.right)
                $0.bottom.equalTo(view.snp.bottom)
            }
        }
    }
    
    func setData() {
        twits.append(Twit(nickname: "마루는 나의 빛", id: "@omarusarang", date: "21분", profileImage: "maru.jpeg", content: "날씨가 너무 좋다 마루야~ 난 항상 네 편이야 누나가 많이 사랑하는 거 알지?", contentImage: "maru.jpeg", messageCount: "124", retweetCount: "26k", likeCount: "30.1k", likeStatus: .isLiked))
        twits.append(Twit(nickname: "간호학과오지마라", id: "@imhyunA_", date: "35분", profileImage: "jaesik.jpeg", content: "간호학은 미쳤다! 이곳에 오는 건 미친 짓이다 과거로 돌아갈 수 있다면 과거의 나를 팰 것이다 너희는 오지 마라", contentImage: "", messageCount: "9", retweetCount: "57", likeCount: "20", likeStatus: .isLiked))
        twits.append(Twit(nickname: "이대과탑", id: "@myfavorite_shoes", date: "37분", profileImage: "basic.jpg", content: "아~ 공부 말린다", contentImage: "", messageCount: "1", retweetCount: "2", likeCount: "0", likeStatus: .isNotLiked))
        twits.append(Twit(nickname: "왜가리", id: "@1pillismine", date: "48분", profileImage: "basic.jpg", content: "인생은 아름다워", contentImage: "", messageCount: "23", retweetCount: "17.1k", likeCount: "1k", likeStatus: .isLiked))
        twits.append(Twit(nickname: "고양이", id: "@cat893121", date: "1시", profileImage: "cat.jpeg", content: "고양이가 세상을 구한다", contentImage: "zigu.jpeg", messageCount: "156", retweetCount: "19k", likeCount: "12.6k", likeStatus: .isNotLiked))
        twits.append(Twit(nickname: "토끼", id: "@rabbit__09", date: "1시", profileImage: "rabbit.jpeg", content: "고양인 빠져 우리 토끼가 세상을 구한다", contentImage: "", messageCount: "19", retweetCount: "1k", likeCount: "169", likeStatus: .isLiked))
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainFeedTVCell", for: indexPath) as! MainFeedTVCell
        cell.selectionStyle = .none
        
        cell.twit = twits[indexPath.row]
        cell.fillDataToView()
        
        return cell
    }
}
