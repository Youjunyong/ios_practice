//
//  ViewController.swift
//  07.UIWebView
//
//  Created by 유준용 on 2022/05/13.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    @IBOutlet weak var rewindButton: UIBarButtonItem!
    @IBOutlet weak var fastButton: UIBarButtonItem!
    @IBOutlet weak var urlTextField: UITextField!
    
    func loadWebPage(_ url: String){
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
        indicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func checkUrl(_ url:String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("https://")
        if !flag{
            strUrl = "https://" + strUrl
        }
        return strUrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        loadWebPage("https://naver.com")
    }
    @IBAction func go(_ sender: Any) {
        let url = checkUrl(urlTextField.text!)
        loadWebPage(url)
    }
    
    @IBAction func stop(_ sender: Any) {
        webView.stopLoading()
    }
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func rewind(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    

}

extension ViewController: WKNavigationDelegate {

    
}


