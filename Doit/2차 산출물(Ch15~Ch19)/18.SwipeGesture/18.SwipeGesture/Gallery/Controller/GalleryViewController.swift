//
//  GalleryViewController.swift
//  18.SwipeGesture
//
//  Created by 유준용 on 2022/05/25.
//

import UIKit

class GalleryViewController: UIViewController {
    let viewModel = GalleryViewModel()
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gestureConfigure()
        configure()
    }
    
    //MARK: - Gesture Configure
    private func gestureConfigure(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        [swipeLeft, swipeRight].forEach {
            self.view.addGestureRecognizer($0)
        }
    }
    
    //MARK: - Gesture Action
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .left:
                viewModel.swipeImageView(imageView: self.imageView, gestureDirection: .left)
                viewModel.setPageControl(pageControl: self.pageControl)
                print("left")
            case .right:
                viewModel.swipeImageView(imageView: self.imageView, gestureDirection: .right)
                viewModel.setPageControl(pageControl: self.pageControl)
                print("right")
            default:
                break
            }
        }
    }
    
    private func configure(){
        self.pageControl.numberOfPages = viewModel.pageCount
    }
    
}
