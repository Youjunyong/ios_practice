//
//  ImagePickerViewController.swift
//  AlertNotificationPractice
//
//  Created by 유준용 on 2021/07/30.
//

import UIKit
import PhotosUI
class ImagePickerViewController: UIViewController , PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
    }
 
    
    
    @IBAction func button(_ sender: Any) {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        
    }
}
