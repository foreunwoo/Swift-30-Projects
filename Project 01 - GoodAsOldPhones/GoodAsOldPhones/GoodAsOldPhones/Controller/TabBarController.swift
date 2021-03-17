//
//  TabBarController.swift
//  GoodAsOldPhones
//
//  Created by eunwoo on 2021/03/16.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        // Generate an instance of the ViewController to set on the Tab.
        let firstTab: UIViewController = MemoryVC()
        let secondTab: UIViewController = AboutVC()
        // Create an Array of Tables with Tabs as Elements.
        let tabs = NSArray(objects: firstTab, secondTab)
        // Set the ViewController.
        self.setViewControllers(tabs as? [UIViewController], animated: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


