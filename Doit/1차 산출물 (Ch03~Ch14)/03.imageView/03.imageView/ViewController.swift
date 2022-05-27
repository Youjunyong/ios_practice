//
//  ViewController.swift
//  03.imageView
//
//  Created by 유준용 on 2022/05/11.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Property
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    var lampImageHeightAnchor: NSLayoutConstraint?
    var lampImageWidthAnchor: NSLayoutConstraint?

    //MARK: UI Component
    let btnResize: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btnResizeImage), for: .touchUpInside)
        btn.setTitle("확대", for: .normal)
        return btn
    }()
    
    let lampImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let lampSwitch: UISwitch = {
        let lampSwitch = UISwitch()
        lampSwitch.translatesAutoresizingMaskIntoConstraints = false
        lampSwitch.addTarget(self, action: #selector(switchOnOff(_:)), for: .valueChanged)
        return lampSwitch
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        self.imgOn = UIImage(named: "lamp_on")
        self.imgOff = UIImage(named: "lamp_off")
        lampImage.image = imgOn
        configureUI()
        self.lampImageHeightAnchor = lampImage.heightAnchor.constraint(equalToConstant: 316)
        self.lampImageHeightAnchor?.isActive = true
        self.lampImageWidthAnchor = lampImage.widthAnchor.constraint(equalToConstant: 200)
        self.lampImageWidthAnchor?.isActive = true

    }
    
    //MARK: Method
    @objc func switchOnOff(_ sender: UISwitch){
        if(sender.isOn){
            lampImage.image = self.imgOn
        }else{
            lampImage.image = self.imgOff
        }
    }
    
    @objc func btnResizeImage(){
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        if (isZoom){
            newWidth = lampImage.frame.width / scale
            newHeight = lampImage.frame.height / scale
            btnResize.setTitle("확대", for: .normal)
        }else{
            newWidth = lampImage.frame.width * scale
            newHeight = lampImage.frame.height * scale
            btnResize.setTitle("축소", for: .normal)
        }
        lampImageWidthAnchor?.constant =  newWidth
        lampImageHeightAnchor?.constant = newHeight
        isZoom.toggle()
    }
    
    // MARK: - Configure UI
    private func configureUI(){
        [lampImage, btnResize, lampSwitch].forEach{
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            lampImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lampImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            btnResize.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            btnResize.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
            lampSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            lampSwitch.bottomAnchor.constraint(equalTo: btnResize.bottomAnchor)
        ])
    }
}

