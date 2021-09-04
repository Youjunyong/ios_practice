//
//  ViewController.swift
//  AutoLayout
//
//  Created by 유준용 on 2021/09/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redBox: UIView!
    
    @IBAction func btn(_ sender: Any) {
        var frame = redBox.frame.size
        frame.width = 500
        frame.height = 500
//        redBox.frame.size = frame
        print(frame)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var frame = redBox.frame.size
        
        
//        redBox.frame.size = frame
        print(frame)
        // Do any additional setup after loading the view.
    }


}

