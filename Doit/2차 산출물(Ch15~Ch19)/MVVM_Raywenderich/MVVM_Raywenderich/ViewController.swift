//
//  ViewController.swift
//  MVVM_Raywenderich
//
//  Created by 유준용 on 2022/05/23.
//



import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stuart = Pet(name: "stuart", birthday: Date(timeIntervalSinceNow: -2 * 86400 * 366), rarity: .rare, image: UIImage(systemName: "clock.fill")!)
        let viewModel = PetViewModel(pet: stuart)
        let frame = CGRect(x: 0, y: 0, width: 300, height: 420)
        let view = PetView(frame: frame)
        
    // MARK: - viewModel에 configure함수를 작성하여 한줄로 줄인다.
        viewModel.configure(view)
//        view.nameLabel.text = viewModel.name
//        view.imageView.image = viewModel.image
//        view.ageLabel.text = viewModel.ageText
//        view.adoptionFeeLabel.text = viewModel.adoptionFeeText
        self.view.addSubview(view)
    }
}

