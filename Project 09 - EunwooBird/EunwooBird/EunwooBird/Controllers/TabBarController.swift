//
//  TabbarController.swift
//  EunwooBird
//
//  Created by eunwoo on 2021/04/09.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        tabBar.barTintColor = .birdNavy // TabBar 의 배경 색
        tabBar.tintColor = .birdBlue // TabBar Item 이 선택되었을때의 색
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)

        setUpTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpTabBar() {
        let mainVC = MainVC()
        let searchVC = SearchVC()
        let notificationVC = NotificationVC()
        let messageVC = MessageVC()
        
        viewControllers = [mainVC,
                           searchVC,
                           notificationVC,
                           messageVC]
    }

}
