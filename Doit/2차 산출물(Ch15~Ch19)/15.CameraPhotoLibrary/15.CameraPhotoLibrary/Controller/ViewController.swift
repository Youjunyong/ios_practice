//
//  ViewController.swift
//  15-1.CameraPhotoLibrary(collage)
//
//  Created by 유준용 on 2022/05/18.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var upperImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var pictureButton: UIButton!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var initButton: UIButton!
    
    //MARK: - Properties
    var viewModel = ViewModel(model: Model(upperImage: UIImage(), leftImage: UIImage(), rightImage: UIImage()))
    var imagePicker = UIImagePickerController()
    var captureImage: UIImage!
    var flagImageSave: Bool = false
    
    //MARK: - Event Action
    @IBAction func picture(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
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
        viewModel.imageViewDelete(up: upperImageView, left: leftImageView, right: rightImageView)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
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
            viewModel.saveImage(up: upperImageView, left: leftImageView, right: rightImageView, captureImage: captureImage)
            viewModel.nextImgView()
        }
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        if viewModel.imageNum > 0{
            viewModel.model.imageNum -= 1
        }
        self.dismiss(animated: true)
    }
}
