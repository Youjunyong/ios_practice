//
//  ViewContrller3.swift
//  10.UITabBarController
//
//  Created by 유준용 on 2022/05/13.
//

import UIKit

class ViewController3: UIViewController {
    //MARK: - UI Components
    let btn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setTitle("첫번째 탭으로 이동", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        btn.addTarget(self, action: #selector(goFirstTab), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            btn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func goFirstTab(){
        self.tabBarController?.selectedIndex = 0
    }
}
