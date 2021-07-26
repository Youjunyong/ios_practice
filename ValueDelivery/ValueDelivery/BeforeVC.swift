//
//  ViewController.swift
//  ValueDelivery
//
//  Created by 유준용 on 2021/07/26.
//

import UIKit

class BeforeVC: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func submit(_ sender: Any) {
        guard let AfterVCInstance = self.storyboard?.instantiateViewController(withIdentifier: "AfterVC") as? AfterVC  else{ return }
        
        AfterVCInstance.labelText = textField.text!
        present(AfterVCInstance, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

