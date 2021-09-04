//
//  ViewController.swift
//  WebViewPrac
//
//  Created by 유준용 on 2021/08/20.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBAction func safariBtn(_ sender: Any) {
        let urlStr = urlTextField.text!
        let url = URL(string: urlStr)!
        UIApplication.shared.open(url, options: [:]) { (re) in
            print(re)
        }
        
    }
    
    @IBAction func webViewBtn(_ sender: Any) {
        if let webVC = self.storyboard!.instantiateViewController(withIdentifier: "webViewController") as? WebViewController {
            
            let urlStr = urlTextField.text!
            let url = URL(string: urlStr)
            let request = URLRequest(url: url!)
            webVC.request = request
            webVC.modalPresentationStyle = .fullScreen
            present(webVC, animated: true, completion: nil)
        }
    }
    @IBOutlet weak var urlTextField: UITextField!
    @IBAction func SFsafari(_ sender: Any) {
        
        let url = URL(string: "https://www.google.com/")
        let safariViewController = SFSafariViewController(url: url!)

        present(safariViewController, animated: true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

