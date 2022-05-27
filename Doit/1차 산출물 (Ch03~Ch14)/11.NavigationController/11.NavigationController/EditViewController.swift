//
//  EditViewController.swift
//  11.NavigationController
//
//  Created by 유준용 on 2022/05/16.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Closure & Delegate Property
    var send: ((String) -> ())?
    var lampOnOff: ((Bool) -> ())?
    
    var delegate: ViewController?
    
    // MARK: - UI Components
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    let switchLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "켜기"
        label.textColor = .black
        return label
    }()
    
    let lampSwitch: UISwitch = {
        let swc = UISwitch()
        swc.translatesAutoresizingMaskIntoConstraints = false
        swc.isOn = false
        return swc
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
    
    let goBackButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("완료", for: .normal)
        btn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        btn.setTitleColor(UIColor.blue, for: .normal)
        return btn
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        messageTextField.delegate = self
        configureUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.send!(self.messageTextField.text!)
        self.lampOnOff!(lampSwitch.isOn)
    }
    
    //MARK: - Initializer
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    //MARK: - Method
    @objc func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Configure UI
    private func configureUI(){
        [messageLabel ,messageTextField].forEach {
            stackView.addArrangedSubview($0)
        }
        [goBackButton, stackView, switchLabel, lampSwitch, ].forEach {
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            goBackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            goBackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: goBackButton.bottomAnchor, constant: 30),
            stackView.heightAnchor.constraint(equalToConstant: 80),
            
            messageTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor ),
            
            lampSwitch.topAnchor.constraint(equalTo: goBackButton.bottomAnchor, constant: 20),
            lampSwitch.trailingAnchor.constraint(equalTo: goBackButton.trailingAnchor),
            switchLabel.trailingAnchor.constraint(equalTo: lampSwitch.leadingAnchor, constant: -10),
            switchLabel.centerYAnchor.constraint(equalTo: lampSwitch.centerYAnchor),
        ])
    }
}
