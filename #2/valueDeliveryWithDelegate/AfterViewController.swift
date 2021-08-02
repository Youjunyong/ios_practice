//
//  AfterViewController.swift
//  valueDeliveryWithDelegate
//
//  Created by 유준용 on 2021/07/31.
//

import UIKit

class AfterViewController: UIViewController {

    var delegate : SendData?
    
    
    @IBOutlet weak var inputField: UITextField!
    @IBAction func ChangeBtn(_ sender: Any) {
        delegate?.send(self, Input: inputField.text)
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputField.delegate = self

    }


}
extension AfterViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.send(self, Input: inputField.text)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        return true
    }
}


