//
//  ViewController.swift
//  19.PinchGesture
//
//  Created by 유준용 on 2022/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var initialFontSize: CGFloat!
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        if (pinch.state == UIGestureRecognizer.State.began){
            initialFontSize = textLabel.font.pointSize
        }else{
            textLabel.font = textLabel.font.withSize(initialFontSize * pinch.scale)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
}

