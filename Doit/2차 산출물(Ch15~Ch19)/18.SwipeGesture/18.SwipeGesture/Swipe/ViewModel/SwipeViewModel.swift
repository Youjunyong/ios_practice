//
//  ViewModel.swift
//  18.SwipeGesture
//
//  Created by 유준용 on 2022/05/24.
//

import Foundation
import UIKit

class SwipeViewModel {
    let model: ImageModel
    
    init(model: ImageModel) {
        self.model = model
    }
    
    func setImage(direction: ArrowDirection, color: ArrowColor, imageView: UIImageView, label: UILabel){
        var imageName = "arrow"
        label.text = ""
        
        switch direction {
        case .up:
            imageName += "-up"
            label.text! += "위로, "
        case .down:
            imageName += "-down"
            label.text! += "아래로, "
        case .left:
            imageName += "-left"
            label.text! += "왼쪽으로, "
        case .right:
            imageName += "-right"
            label.text! += "오른쪽으로, "
        }
        
        switch color {
        case .black:
            imageName += "-black"
        case .green:
            imageName += "-green"
            label.text! += "두손가락 터치"
        case .red:
            imageName += "-red"
            label.text! += "한손가락 터치"
        }
        
        imageView.image = UIImage(named: imageName)
    }
}
