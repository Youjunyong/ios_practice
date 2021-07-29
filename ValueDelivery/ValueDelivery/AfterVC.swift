//
//  AfterVC.swift
//  ValueDelivery
//
//  Created by 유준용 on 2021/07/26.
//

import UIKit

class AfterVC: UIViewController {
    var labelText : String = ""
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
        print("AFTERVC")
//        guard let BeforeVC = self.presentingViewController as? BeforeVC else{return}

        
        BeforeVC.paramCount += 1
        print("In AfterVC :", BeforeVC.paramCount)
        // Do any additional setup after loading the view.
    }
}
