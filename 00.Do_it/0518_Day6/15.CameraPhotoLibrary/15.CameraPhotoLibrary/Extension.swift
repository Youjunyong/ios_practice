//
//  Extension.swift
//  15.CameraPhotoLibrary
//
//  Created by 유준용 on 2022/05/18.
//

import UIKit

extension ViewController{
    func myAlert(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
