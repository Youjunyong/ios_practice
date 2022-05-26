//
//  ViewModel.swift
//  15-1.CameraPhotoLibrary(collage)
//
//  Created by 유준용 on 2022/05/26.
//

import Foundation
import UIKit

class ViewModel {
    var model: Model
    
    var imageNum: Int{
        return model.imageNum
    }
    
    init(model: Model) {
        self.model = model
    }
    
    func imageViewDelete(up: UIImageView, left: UIImageView, right: UIImageView){
        [up, left, right].forEach {
            $0.image = nil
        }
        model.imageNum = 0
    }
    func saveImage(up: UIImageView, left: UIImageView, right: UIImageView, captureImage: UIImage){
        switch imageNum{
        case 0:
            up.image = captureImage
        case 1:
            left.image = captureImage
        case 2:
            right.image = captureImage
        default:
            break
        }
    }
    
    func nextImgView(){
        if imageNum > 1{
            model.imageNum = -1
        }
        model.imageNum += 1
    }
    
}
