//
//  ViewController.swift
//  Pract
//
//  Created by 유준용 on 2022/01/07.
//

import Combine
import UIKit

class ViewController: UIViewController {

    var flag = 1
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "*blue.frame: \(blue.frame.origin)\n*red.frame:\(red.frame.origin)\n*blue.bounds: \(blue.bounds.origin)\n*red.bounds:\(red.bounds.origin)"
        return label
    }()
    lazy var blue: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var red: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.backgroundColor = .red
        return view
    }()
    

    
    lazy var toggleButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(toggle(_: )), for: .touchUpInside)
        btn.setTitle("Toggle", for: .normal)
        btn.backgroundColor = .brown
        btn.titleLabel?.textColor = .red
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }

    @objc func toggle(_: UIButton){
        if self.flag == 1{
            self.flag = 0
            blue.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
            
        }else{
            self.flag = 1
            blue.bounds = CGRect(x: 100, y: 100, width: 300, height: 300)
        }
        label.text = "*blue.frame: \(blue.frame.origin)\n*red.frame:\(red.frame.origin)\n*blue.bounds: \(blue.bounds.origin)\n*red.bounds:\(red.bounds.origin)"

    }
    private func configureUI(){
        view.addSubview(blue)
        blue.addSubview(red)
        view.addSubview(toggleButton)

        view.addSubview(label)
        NSLayoutConstraint.activate([
            toggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toggleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

