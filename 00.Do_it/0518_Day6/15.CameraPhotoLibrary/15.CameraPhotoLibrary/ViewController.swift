//
//  ViewController.swift
//  15.CameraPhotoLibrary
//
//  Created by 유준용 on 2022/05/18.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController {
    
    //MARK: - UI
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pictureButton: UIButton!
    @IBOutlet weak var loadPictureButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var loadVideoButton: UIButton!
    
    //MARK: - Stored Property
    let imagePicker = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave = false
    
    //MARK: - Method
    //사진촬영
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
    
    //사진 불러오기
    @IBAction func loadPicture(_ sender: Any) {
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
    
    //동영상 촬영
    @IBAction func recordVedio(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.movie"]
            flagImageSave = true
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            myAlert("Camera inaccessble", message: "Application cannot access the camera")
        }
    }
    
    //동영상 불러오기
    @IBAction func loadVedio(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.movie"]
            flagImageSave = false
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            myAlert("Photo album inaccessble", message: "Application cannot access the album")
        }
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
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
            imageView.image = captureImage
        }else if mediaType.isEqual(to: "public.movie" as String){
            if flagImageSave{
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
}
