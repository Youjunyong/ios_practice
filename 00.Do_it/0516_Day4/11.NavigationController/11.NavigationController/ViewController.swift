//
//  ViewController.swift
//  11.NavigationController
//
//  Created by 유준용 on 2022/05/16.
//

import UIKit

class ViewController: UIViewController {
    let messageLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "no message"
        return label
    }()
    
    let editButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("수정화면", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(goEdit), for: .touchUpInside)
        return btn
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "lamp_off")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "메인화면"
        configureUI()
    }
    @objc func goEdit(){
        self.navigationController?.pushViewController(EditViewController(), animated: true)
    }
    
    private func configureUI(){
        
        
        // MARK: - NavigationBarButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(goEdit))
        
        view.addSubview(imageView)
        view.addSubview(editButton)
        view.addSubview(messageLabel)
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 30),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
            messageLabel.centerYAnchor.constraint(equalTo: editButton.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40)
            
        ])
        
        
    }

}

