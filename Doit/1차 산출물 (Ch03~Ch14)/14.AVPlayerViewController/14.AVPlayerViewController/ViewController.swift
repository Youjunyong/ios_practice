//
//  ViewController.swift
//  14.AVPlayerViewController
//
//  Created by 유준용 on 2022/05/18.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    //MARK: - UI Components
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.contentMode = .scaleAspectFit
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let internalVideoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "앱 내부 비디오 재생, mp4"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let centerVideoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "앱 내부 비디오 재생, mov"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let externalVideoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "앱 외부 비디오 재생, mp4"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let externalVideoLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "앱 외부 비디오 재생, mov"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let internalVideoButton: UIButton = {
        let btn = UIButton()
        btn.frame.size.height = 50
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(internalVideoPlay), for: .touchUpInside)
        btn.setImage(UIImage(named: "FastTyping"), for: .normal)
        NSLayoutConstraint.activate([
            btn.heightAnchor.constraint(equalToConstant: 150)
        ])
        return btn
    }()
    
    let internalVideoButton2: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "Mountaineering"), for: .normal)
        btn.addTarget(self, action: #selector(internalVideoPlay2), for: .touchUpInside)
        NSLayoutConstraint.activate([
            btn.heightAnchor.constraint(equalToConstant: 150),
        ])
        return btn
    }()
    
    let externalVideoButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(externalVideoPlay), for: .touchUpInside)
        btn.setImage(UIImage(named: "Fireworks"), for: .normal)
        NSLayoutConstraint.activate([
            btn.heightAnchor.constraint(equalToConstant: 150),
        ])
        return btn
    }()
    
    let externalVideoButton2: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(externalVideoPlay2), for: .touchUpInside)
        btn.setImage(UIImage(named: "Seascape"), for: .normal)
        NSLayoutConstraint.activate([
            btn.heightAnchor.constraint(equalToConstant: 150)
        ])
        return btn
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    //MARK: - Video Play
    
    private func playVideo(url: URL){
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url)
        playerController.player = player
        self.present(playerController, animated: true) {
            player.play()
        }
    }
    
    @objc func internalVideoPlay(){
        let filePath: String? = Bundle.main.path(forResource: "FastTypingVideo", ofType: "mp4")
        let url = URL(fileURLWithPath: filePath!)
        playVideo(url: url)
    }
    
    @objc func internalVideoPlay2(){
        let filePath: String? = Bundle.main.path(forResource: "Mountaineering", ofType: "mov")
        let url = URL(fileURLWithPath: filePath!)
        playVideo(url: url)
    }
    @objc func externalVideoPlay(){
        let url = URL(string: VideoUrl().url)
        playVideo(url: url!)
    }
    @objc func externalVideoPlay2(){
        let url = URL(string: VideoUrl().url2)
        playVideo(url: url!)
    }
    //MARK: - Configure UI
    
    private func configureUI(){
        [internalVideoLabel, internalVideoButton, internalVideoLabel, internalVideoButton2, centerVideoLabel, externalVideoLabel, externalVideoButton,externalVideoLabel, externalVideoButton2, externalVideoLabel2].forEach {
            stackView.addArrangedSubview($0)
        }
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
}

