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
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return  .lightContent
    }

    
    
    @IBOutlet weak var cancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("displayName:" + Bundle.displayName)
        print(Bundle.appVersion)
        print(Bundle.appBuildVersion)
        print(Bundle.bundleIdentifier)
        let background = UIImage(named: "background_1")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = background
        cancel.isUserInteractionEnabled = false
        profileImage.layer.cornerRadius = profileImage.frame.width / 2.4
        profileImage.clipsToBounds = true
    }
    

}
extension Bundle{
    class var displayName : String{
        if let value = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String{
            return value
        }
        return ""
    }
    
    class var appVersion: String{
        if let value = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return value
        }
        return ""
    }
    
    class var appBuildVersion: String{
        if let value = Bundle.main.infoDictionary?["CFBundleVersion"] as? String{
            return value
        }
        return ""
    }
    
    class var bundleIdentifier: String{
        if let value = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String {
            return value
        }
        return ""
    }
}

