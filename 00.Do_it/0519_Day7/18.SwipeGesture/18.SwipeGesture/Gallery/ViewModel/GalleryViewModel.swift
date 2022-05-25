//
//  GalleryViewModel.swift
//  18.SwipeGesture
//
//  Created by 유준용 on 2022/05/25.
//

import UIKit

class GalleryViewModel{
    var model = GalleryModel(page: 1, image: UIImage(named:"01")!)
    
    var nowPage: Int {
        return model.page
    }
    
    var pageCount: Int {
        return model.pageCount
    }
    
    var nowImage: UIImage {
        return UIImage(named: "0\(nowPage)")!
    }

    func swipeImageView(imageView: UIImageView, gestureDirection: GalleryModel.GestureDirection){
        switch gestureDirection{
        case .left:
            if nowPage > 5 {
                model.page = 0
            }
            model.page += 1
        case .right:
            if nowPage < 2 {
                model.page = 7
            }
            model.page -= 1
        }
        imageView.image = nowImage
    }
    
    func setPageControl(pageControl: UIPageControl){
        pageControl.currentPage = nowPage - 1
    }
    
}
