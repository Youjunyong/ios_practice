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
    

    lazy var testFrame: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
        
        view.backgroundColor = .blue
        return view
    }()
    lazy var testBounds: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = .red
        return view
    }()
    lazy var testBounds2: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 130, y: 140, width: 30, height: 30)
//        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = .brown
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
        
        
        print(view.superview)
        DispatchQueue.main.async {
            print(1)
            print(2)
            print(3)
        }
//        DispatchQueue.main.sync {
//            print("a")
//            print("b")
//            print("c")
//        }
        
        // Do any additional setup after loading the view.
    }

    @objc func toggle(_: UIButton){
        if self.flag == 1{
            self.flag = 0
            testFrame.bounds = CGRect(x: 0, y: 100, width: 300, height: 300)
            print("flag == 1 , frame: ",testBounds.frame)
        }else{
            self.flag = 1
            testFrame.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
            print("flag == 2 , frame: ",testBounds.frame)
        }

    }
    private func configureUI(){
        
        view.addSubview(testFrame)
        testFrame.addSubview(testBounds)
        view.addSubview(toggleButton)
        testBounds.addSubview(testBounds2)
        NSLayoutConstraint.activate([
            toggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toggleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }

}

