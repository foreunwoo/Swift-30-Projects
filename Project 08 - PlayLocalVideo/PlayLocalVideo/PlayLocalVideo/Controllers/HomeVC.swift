//
//  HomeVC.swift
//  PlayLocalVideo
//
//  Created by eunwoo on 2021/04/01.
//

import UIKit
import SnapKit
import Then
import AVKit

class HomeVC: UIViewController {
    
    let videoTableView = UITableView(frame: .zero, style: .plain)
    
    let localPath = "/Users/eunwoo/Swift-30-Projects/Video/"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        setTableView()
    }
    
    func setTableView() {
        _ = videoTableView.then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.clipsToBounds = true
            
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(VideoTVCell.self, forCellReuseIdentifier: "VideoTVCell")
            
            view.addSubview($0)
            
            $0.snp.makeConstraints {
                $0.top.equalTo(view.snp.top)
                $0.left.equalTo(view.snp.left)
                $0.right.equalTo(view.snp.right)
                $0.bottom.equalTo(view.snp.bottom)
            }
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTVCell", for: indexPath) as! VideoTVCell
        
        if let image = UIImage(named: "v\(indexPath.row+1)") {
            cell.preImageView.image = image
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = AVPlayer(url: URL(fileURLWithPath: localPath + "v\(indexPath.row+1).mp4"))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true, completion: {
            player.play()
        })
    }
    
    
}


