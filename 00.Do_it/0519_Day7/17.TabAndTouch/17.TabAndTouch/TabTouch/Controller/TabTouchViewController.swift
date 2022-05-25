//
//  ViewController.swift
//  17.TabAndTouch
//
//  Created by 유준용 on 2022/05/19.
//

import UIKit

class TabTouchVC: UIViewController {

    //MARK: - View
    let tabTouchCountView = TabTouchView()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Touch Event
    private func updateLabel(touches: Set<UITouch>, type: TouchType){
        let touch = touches.first! as UITouch
        switch type {
        case .began:
            tabTouchCountView.messageLabel.text = "Touches Began!"
            tabTouchCountView.messageLabel.textColor = .red
        case .ended:
            tabTouchCountView.messageLabel.text = "Touches Ended!"
            tabTouchCountView.messageLabel.textColor = .blue
        case .moved:
            tabTouchCountView.messageLabel.text = "Touches Moved!"
            tabTouchCountView.messageLabel.textColor = .green
        }
        tabTouchCountView.tabCountLabel.text = String(touch.tapCount)
        tabTouchCountView.touchCountLabel.text = String(touches.count)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateLabel(touches: touches, type: .began)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateLabel(touches: touches, type: .moved)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateLabel(touches: touches, type: .ended)
    }
    
    //MARK: - Present
    @objc func sketchPresent(){
        let sketchVC = SketchVC()
        sketchVC.modalPresentationStyle = .fullScreen
        self.present(sketchVC, animated: true)
    }
    
    //MARK: - Configure
    private func configure(){
        self.view.backgroundColor = .white
        self.view.isMultipleTouchEnabled = true
        tabTouchCountView.translatesAutoresizingMaskIntoConstraints = false
        tabTouchCountView.sketchButton.addTarget(self, action: #selector(sketchPresent), for: .touchUpInside)
        view.addSubview(tabTouchCountView)
        NSLayoutConstraint.activate([
            tabTouchCountView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            tabTouchCountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            tabTouchCountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            tabTouchCountView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}



