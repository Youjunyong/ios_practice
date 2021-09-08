//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by 유준용 on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    
    @IBOutlet weak var cancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let background = UIImage(named: "background_1")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = background
        cancel.isUserInteractionEnabled = false
        profileImage.layer.cornerRadius = profileImage.frame.width / 2.4
        profileImage.clipsToBounds = true
    }


}

