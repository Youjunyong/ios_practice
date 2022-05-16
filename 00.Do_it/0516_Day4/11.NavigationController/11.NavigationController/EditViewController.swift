//
//  EditViewController.swift
//  11.NavigationController
//
//  Created by 유준용 on 2022/05/16.
//

import UIKit

class EditViewController: UIViewController {
    
    
    
    let goBackButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("완료", for: .normal)
        btn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        btn.setTitleColor(UIColor.blue, for: .normal)
        return btn
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    
    @objc func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    private func configureUI(){
        view.addSubview(goBackButton)
        NSLayoutConstraint.activate([
            goBackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            goBackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
        ])
    }
}
