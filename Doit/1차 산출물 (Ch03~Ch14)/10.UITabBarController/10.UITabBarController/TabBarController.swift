//
//  TabBarController.swift
//  10.UITabBarController
//
//  Created by 유준용 on 2022/05/13.
//

import UIKit

class TabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        self.view.backgroundColor = .white
        self.tabBar.backgroundColor = .systemYellow
        
        let VC1 = ViewController()
        let VC2 = ViewController2()
        let VC3 = ViewController3()
        
        VC1.tabBarItem.image = UIImage(systemName: "star.fill")
        VC2.tabBarItem.image = UIImage(systemName: "book.fill")
        VC3.tabBarItem.image = UIImage(systemName: "clock.fill")
        
        VC1.tabBarItem.title = "첫번째"
        VC2.tabBarItem.title = "두번째"
        VC3.tabBarItem.title = "세번째"
        self.viewControllers = [VC1, VC2, VC3]
    }
}
