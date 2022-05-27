//
//  ViewController.swift
//  18.SwipeGesture
//
//  Created by 유준용 on 2022/05/20.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Property
    let viewModel = SwipeViewModel(model: ImageModel())
    
    //MARK: - IBOutlet (UI)
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgViewUp: UIImageView!
    @IBOutlet weak var imgViewLeft: UIImageView!
    @IBOutlet weak var imgViewRight: UIImageView!
    @IBOutlet weak var imgViewDown: UIImageView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        gestureConfigure()
        gestureMultiConfigure()
    }
    
    //MARK: - 한손가락 제스쳐 Configure
    private func gestureConfigure(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        [swipeUp, swipeDown, swipeLeft, swipeRight].forEach {
            self.view.addGestureRecognizer($0)
        }
    }
    
    
    //MARK: - 두손가락 제스쳐 Configure
    private func gestureMultiConfigure(){
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGestureMulti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGestureMulti(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        [swipeUpMulti, swipeDownMulti, swipeLeftMulti, swipeRightMulti].forEach {
            $0.numberOfTouchesRequired = 2
            self.view.addGestureRecognizer($0)
        }
    }
    
    //MARK: - 두손가락 제스쳐 Action
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            setImageDefalut()
            switch swipeGesture.direction {
            case .up:
                viewModel.setImage(direction: .up, color: .green, imageView: imgViewUp, label: titleLabel)
            case .down:
                viewModel.setImage(direction: .down, color: .green, imageView: imgViewDown, label: titleLabel)
            case .left:
                viewModel.setImage(direction: .left, color: .green, imageView: imgViewLeft, label: titleLabel)
            case .right:
                viewModel.setImage(direction: .right, color: .green, imageView: imgViewRight, label: titleLabel)
            default:
                return
            }
        }
    }
    
    // MARK: - 한손가락 제스쳐 Action
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            setImageDefalut()
            switch swipeGesture.direction {
            case .up:
                viewModel.setImage(direction: .up, color: .red, imageView: imgViewUp, label: titleLabel)
            case .down:
                viewModel.setImage(direction: .down, color: .red, imageView: imgViewDown, label: titleLabel)
            case .left:
                viewModel.setImage(direction: .left, color: .red, imageView: imgViewLeft, label: titleLabel)
            case .right:
                viewModel.setImage(direction: .right, color: .red, imageView: imgViewRight, label: titleLabel)
            default:
                break
            }
        }
    }
    
    // 기본 화살표 이미지 (Black)
    private func setImageDefalut(){
        viewModel.setImage(direction: .up, color: .black, imageView: imgViewUp, label: titleLabel)
        viewModel.setImage(direction: .down, color: .black, imageView: imgViewDown, label: titleLabel)
        viewModel.setImage(direction: .left, color: .black, imageView: imgViewLeft, label: titleLabel)
        viewModel.setImage(direction: .right, color: .black, imageView: imgViewRight, label: titleLabel)
    }
}
