//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by 유준용 on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var upperContiner: UIView!
    @IBOutlet weak var lowerContiner: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upperContiner.backgroundColor = UIColor.systemPink
        lowerContiner.backgroundColor = UIColor.systemGray
        let background = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = background
    }


}

