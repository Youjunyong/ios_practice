//
//  GalleryModel.swift
//  18.SwipeGesture
//
//  Created by 유준용 on 2022/05/25.
//

import Foundation
import UIKit

class GalleryModel {
    var page: Int
    var image: UIImage
    var pageCount = 6
    
    init(page: Int, image: UIImage){
        self.page = page
        self.image = image
    }
    
    enum GestureDirection: String {
        case left, right
    }
}
