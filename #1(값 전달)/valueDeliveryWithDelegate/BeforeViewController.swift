//
//  ViewController.swift
//  valueDeliveryWithDelegate
//
//  Created by 유준용 on 2021/07/31.
//

import UIKit

class BeforeViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    
    @IBAction func valueChangeBtn(_ sender: Any) {
        guard let AfterVC = self.storyboard?.instantiateViewController(withIdentifier: "AfterVC") as? AfterViewController else{return}
        AfterVC.delegate = self
        AfterVC.modalPresentationStyle = .fullScreen
        present(AfterVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension BeforeViewController: SendData {
    func send(_ vc: UIViewController, Input value: String?) {
        valueLabel.text = value
    }
}
