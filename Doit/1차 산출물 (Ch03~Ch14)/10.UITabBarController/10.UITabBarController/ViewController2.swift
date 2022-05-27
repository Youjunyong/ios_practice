//
//  ViewContrller2.swift
//  10.UITabBarController
//
//  Created by 유준용 on 2022/05/13.
//

import UIKit
class ViewController2: UIViewController {
    
    //MARK: - UI Components
    let imageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Selected Item:"
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "1")
        return imageView
    }()
    
    let pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.contentMode = .scaleAspectFit
        return pickerView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Configure UI
    private func configureUI(){
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.view.addSubview(pickerView)
        self.view.addSubview(imageView)
        self.view.addSubview(imageLabel)
        NSLayoutConstraint.activate([
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            pickerView.heightAnchor.constraint(equalToConstant: 170),
            pickerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: pickerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: pickerView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 70),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            imageLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
            imageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
    }
}

//MARK: - Picker View Delegate
extension ViewController2: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerImageView = UIImageView()
        pickerImageView.image = UIImage(named: "\(row + 1)")
        pickerImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        return pickerImageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.imageLabel.text = "Selected Item: \(row + 1).jpg"
        self.imageView.image = UIImage(named: "\(row + 1)")
    }
}
