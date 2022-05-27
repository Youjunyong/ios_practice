//
//  ViewController.swift
//  03.imageView(mission)
//
//  Created by 유준용 on 2022/05/11.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Property
    var imageNum = 1
    
    //MARK: - UI Components
    let nextButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("다음", for: .normal)
        btn.setTitleColor( UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(nextImage(_:)), for: .touchUpInside)
        return btn
    }()
    
    let preButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("이전", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(preImage(_:)), for: .touchUpInside)
        return btn
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func updateImage(){
        self.imageView.image = UIImage(named: "\(imageNum)")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        updateImage()
    }

    //MARK: - Method (User event)
    @objc func nextImage(_ sender: UIButton){
        self.imageNum += 1
        if imageNum > 6 {
            imageNum = 1
        }
        updateImage()
    }
    
    @objc func preImage(_ sender: UIButton){
        self.imageNum -= 1
        if imageNum < 1 {
            imageNum = 6
        }
        updateImage()
    }
    
    //MARK: - Configure UI
    private func configureUI(){
        view.backgroundColor = .white
        [imageView, preButton, nextButton].forEach {
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            
            preButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            preButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            
            nextButton.bottomAnchor.constraint(equalTo: preButton.bottomAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
        
    }

}

