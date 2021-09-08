//
//  WebViewController.swift
//  WebViewPrac
//
//  Created by 유준용 on 2021/08/20.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    var request : URLRequest? = nil
//    {
//        didSet {
//            self.webView.load(request!)
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if request != nil {
            self.webView.load(request!)
        }else{
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
