//
//  View.swift
//  MVVM_Raywenderich
//
//  Created by 유준용 on 2022/05/23.
//

import Foundation
import UIKit

class PetView: UIView {
    // 4개의 SubView를 가졌다.
    let imageView: UIImageView
    let nameLabel: UILabel
    let ageLabel: UILabel
    let adoptionFeeLabel: UILabel
    // 레이아웃
    override init(frame: CGRect) {
        var childFrame = CGRect(x: 0, y: 16, width: frame.width, height: frame.height / 2)
        
        imageView = UIImageView(frame: childFrame)
        imageView.contentMode = .scaleAspectFit
        childFrame.origin.y += childFrame.height + 16
        childFrame.size.height = 30
        nameLabel = UILabel(frame: childFrame)
        nameLabel.textAlignment = .center
        
        childFrame.origin.y += childFrame.height
        ageLabel = UILabel(frame: childFrame)
        ageLabel.textAlignment = .center
        
        childFrame.origin.y += childFrame.height
        adoptionFeeLabel = UILabel(frame: childFrame)
        adoptionFeeLabel.textAlignment = .center
        
        super.init(frame: frame)
        backgroundColor = .white
        [imageView, nameLabel, ageLabel, adoptionFeeLabel].forEach {
            addSubview($0)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
