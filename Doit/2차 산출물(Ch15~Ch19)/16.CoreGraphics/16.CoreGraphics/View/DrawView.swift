//
//  View.swift
//  16.CoreGraphics
//
//  Created by 유준용 on 2022/05/24.
//

import UIKit

class DrawView: UIView {
    
    //MARK: - StackView
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.contentMode = .center
        stackView.alignment = .center
        return stackView
    }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    //MARK: - UIButton
    let lineButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("선", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    let rectButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("사각형", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    let circleButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("원", for: .normal)
        return button
    }()
    
    let arcButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("호", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    let fillButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("채우기", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    let flowerButton: UIButton = {
        let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.setTitle("꽃", for: .normal)
         button.setTitleColor(UIColor.blue, for: .normal)
         return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - UILabel
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "CoreGraphics로 그림 그리기"
        return label
    }()
    
    //MARK: - Initializer
    required override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Confgirue
    private func configureView(){
        [lineButton, rectButton, circleButton, arcButton, fillButton, flowerButton].forEach {
            horizontalStackView.addArrangedSubview($0)
        }
        [titleLabel , horizontalStackView, imageView].forEach {
            verticalStackView.addArrangedSubview($0)
        }
        addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor),
            imageView.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            verticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
