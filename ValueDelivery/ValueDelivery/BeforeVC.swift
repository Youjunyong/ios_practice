//
//  ViewController.swift
//  ValueDelivery
//
//  Created by 유준용 on 2021/07/26.
//

import UIKit

class BeforeVC: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    var paramCount = 0
    @IBAction func submit(_ sender: Any) {
        guard let AfterVCInstance = self.storyboard?.instantiateViewController(withIdentifier: "AfterVC") as? AfterVC  else{ return }
        
        AfterVCInstance.labelText = textField.text!
//        present(AfterVCInstance, animated: true)
        self.navigationController?.pushViewController(AfterVCInstance, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        countLabel.text = String(paramCount)
        print("In BeforeVC:", paramCount)
    }
}

