//
//  ViewController.swift
//  06.UIAlert
//
//  Created by 유준용 on 2022/05/12.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Model Instance
    var lamp: Lamp?
    
    //MARK: - UI Components
    let lampImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.contentMode = .scaleAspectFit
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let onButton: UIButton = {
       let btn = UIButton()
        btn.tag = 0
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(change(_:)), for: .touchUpInside)
        btn.setTitle("켜기", for: .normal)
        return btn
    }()
    
    let offButton: UIButton = {
       let btn = UIButton()
        btn.tag = 1
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(change(_:)), for: .touchUpInside)
        btn.setTitle("끄기", for: .normal)
        return btn
    }()
    
    let removeButton: UIButton = {
       let btn = UIButton()
        btn.tag = 2
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(change(_:)), for: .touchUpInside)
        btn.setTitle("제거", for: .normal)
        return btn
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lamp = Lamp()
        configureUI()
    }
    
    //MARK: - Method & Event
    private func showAlert(act: Act ){
        var title: String
        var message: String
        switch act {
        case .on:
            title = "램프 켜기"
            message = "램프를 켭니다."
        case .off:
            title = "램프 끄기"
            message = "램프를 끕니다."
        case .remove:
            title = "램프 제거"
            message = "램프를 제거합니다."
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let onAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(onAction)
        self.present(alert, animated: true, completion: nil)
    }

    @objc func change(_ sender: UIButton){
        let idx = sender.tag
        switch idx {
        case 0:
            showAlert(act: .on)
            lampImageView.image = lamp?.onImage
        case 1:
            lampImageView.image = lamp?.offImage
            showAlert(act: .off)
        case 2:
            lampImageView.image = lamp?.removeImage
            showAlert(act: .remove)

        default:
            return
        }
    }
    
    //MARK: - Configure UI
    private func configureUI(){
        [onButton, offButton, removeButton].forEach {
            stackView.addArrangedSubview($0)
        }
        [stackView, lampImageView].forEach {
            view.addSubview($0)
        }
        lampImageView.image = lamp!.onImage

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            lampImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lampImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lampImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lampImageView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -50)
        ])
    }
}

