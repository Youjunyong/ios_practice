//
//  ImagePinchViewController.swift
//  19.PinchGesture
//
//  Created by 유준용 on 2022/05/23.
//

import UIKit

class ImagePinchViewController: ViewController {
    
    //MARK: - IBOutlet
    @IBOutlet var imageView: UIImageView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Pinch Recognizer
    @objc func doImagePinch(_ pinch: UIPinchGestureRecognizer){
        imageView.transform = imageView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
    //MARK: - Pinch Configure
    private func configure(){
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(doImagePinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
}
