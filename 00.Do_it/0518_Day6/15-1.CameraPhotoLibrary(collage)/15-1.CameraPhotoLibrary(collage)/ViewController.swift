//
//  ViewController.swift
//  15-1.CameraPhotoLibrary(collage)
//
//  Created by 유준용 on 2022/05/18.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UIImageView
    @IBOutlet weak var upperImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    //MARK: - UIButton
    @IBOutlet weak var pictureButton: UIButton!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var initButton: UIButton!
    
    //MARK: - Stored Property
    var imagePicker = UIImagePickerController()
    var captureImage: UIImage!
    var flagImageSave = false
    var num = 0
    
    //MARK: - Event Method
    @IBAction func picture(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.image"]
            flagImageSave = true
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
            
        }
        else{
            myAlert("Camera inaccessble", message: "Application cannot access the camera")
        }
    }
    
    @IBAction func load(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            flagImageSave = false
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            myAlert("Photo album inaccessble", message: "Application cannot access the album")
        }
    }
    @IBAction func initialize(_ sender: Any) {
        upperImageView.image = nil
        leftImageView.image = nil
        rightImageView.image = nil
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Util
    private func saveImage(){
        switch self.num {
        case 0:
            upperImageView.image = self.captureImage
        case 1:
            leftImageView.image = self.captureImage
        case 2:
            rightImageView.image = self.captureImage
        default:
            break
        }
        
    }
    

}

extension ViewController: UIPickerViewDelegate, UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        if mediaType.isEqual(to: "public.image" as String){
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            if flagImageSave{
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            saveImage()
            if num >= 0, num <= 2 {
                num += 1
            }else{
                num = 0
            }
    }
    self.dismiss(animated: true)
}

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    if num > 0{
        num -= 1
    }
    self.dismiss(animated: true)
}
}
