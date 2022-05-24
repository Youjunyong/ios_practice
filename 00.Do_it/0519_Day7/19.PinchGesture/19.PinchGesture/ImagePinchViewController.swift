//
//  ImagePinchViewController.swift
//  19.PinchGesture
//
//  Created by 유준용 on 2022/05/23.
//

import UIKit

class ImagePinchViewController: ViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(doImagePinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doImagePinch(_ pinch: UIPinchGestureRecognizer){
        imageView.transform = imageView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
}
