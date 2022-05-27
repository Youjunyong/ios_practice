//
//  SketchView.swift
//  17.TabAndTouch
//
//  Created by 유준용 on 2022/05/20.
//

import UIKit

class SketchView: UIView {
    
    //MARK: - StackView
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let horizontalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let colorButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .systemGray5
        return stackView
    }()
    
    //MARK: - Color & Width Button Set
    let colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "색/두께 : "
        label.textColor = .black
        return label
    }()
    
    let widthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let redButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("🔴", for: .normal)
        btn.tag = 100
        btn.setTitleColor(UIColor.red, for: .normal)
        return btn
    }()
    
    let blueButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("🔵", for: .normal)
        btn.tag = 200
        btn.setTitleColor(UIColor.red, for: .normal)
        return btn
    }()
    
    let blackButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("⚫️", for: .normal)
        btn.tag = 300
        btn.setTitleColor(UIColor.red, for: .normal)
        return btn
    }()
    
    let widthIncButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("⬇️", for: .normal)
        btn.tag = 400
        btn.setTitleColor(UIColor.red, for: .normal)
        return btn
    }()
    
    let widthDecButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("⬆️", for: .normal)
        btn.tag = 500
        btn.setTitleColor(UIColor.red, for: .normal)
        return btn
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "기기를 흔들어도 Clear 됩니다."
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("이전화면", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let clearButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("Clear", for: .normal)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        [colorLabel , widthLabel, redButton, blueButton, blackButton, widthIncButton, widthDecButton].forEach {
            colorButtonStackView.addArrangedSubview($0)
        }
        [dismissButton, clearButton].forEach {
            horizontalStackView.addArrangedSubview($0)
        }
        [horizontalStackView, label , imageView, colorButtonStackView].forEach {
            verticalStackView.addArrangedSubview($0)
        }
        [verticalStackView, colorButtonStackView].forEach {
            addSubview($0)
        }
        NSLayoutConstraint.activate([
            colorButtonStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            colorButtonStackView.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            colorButtonStackView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor),
            label.heightAnchor.constraint(equalToConstant: 20),
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: colorButtonStackView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
