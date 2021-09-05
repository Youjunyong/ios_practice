//
//  ViewController.swift
//  AutoLayout
//
//  Created by 유준용 on 2021/09/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redBox: UIView!
    @IBOutlet weak var reboxHeight: NSLayoutConstraint!
    
    
    @IBAction func btn(_ sender: Any) {
        reboxHeight.constant += 100
        if reboxHeight.priority.rawValue == 1000{
            reboxHeight.priority = UILayoutPriority(999)
            }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

