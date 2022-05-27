//
//  ViewController.swift
//  11.NavigationController
//
//  Created by 유준용 on 2022/05/16.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Property
    var imageWidthConstarint: NSLayoutConstraint?
    
    //MARK: - UI Components
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    let messageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Message"
        label.textColor = UIColor.black
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

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "메인화면"
        configureUI()
    }
    
    //MARK: - Method
    @objc func goEdit(){
        let nextVC = EditViewController()
        nextVC.delegate = self
        nextVC.messageTextField.text = self.messageTextField.text!
        nextVC.send = { [weak self] data in
            self?.messageTextField.text = data
        }
        nextVC.lampOnOff = {[weak self] switchValue in
            if switchValue {
                self?.imageView.image = UIImage(named: "lamp_on")
            }else{
                self?.imageView.image = UIImage(named: "lamp_off")
            }
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
//    MARK: Configure UI
    private func configureUI(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(goEdit))
        [messageLabel ,messageTextField].forEach {
            stackView.addArrangedSubview($0)
        }
        [stackView, imageView,editButton].forEach {
            view.addSubview($0)
        }
        self.imageWidthConstarint = imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width)
        self.imageWidthConstarint?.isActive = true
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            imageView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 50),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: editButton.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 80),
            
            messageTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor ),
        ])
    }

}

