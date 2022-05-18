//
//  AddViewController.swift
//  12.UITableViewController
//
//  Created by 유준용 on 2022/05/17.
//

import UIKit

class AddViewController: UIViewController {
    
    let pickerView: UIPickerView = {
       let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.contentMode = .scaleAspectFit
        return pickerView
    }()
    
    let selectedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: Model.shared.itemsImageFile[0])
        return imageView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let addButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(add), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = .white
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    @objc func add(){
        let item = self.textField.text!
        let imageName = Model.shared.itemsImageFile[pickerView.selectedRow(inComponent: 0)]
        Model.shared.itemsImageFile.append(imageName)
        Model.shared.items.append(item)
        self.navigationController?.popViewController(animated: true)
    }

    private func configureUI(){
        [textField, pickerView, selectedImageView, addButton].forEach {
            view.addSubview($0)
        }
        pickerView.dataSource = self
        pickerView.delegate = self
        
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pickerView.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 200),
            
            selectedImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            selectedImageView.topAnchor.constraint(equalTo: pickerView.topAnchor),
            selectedImageView.bottomAnchor.constraint(equalTo: pickerView.bottomAnchor),
            selectedImageView.trailingAnchor.constraint(equalTo: pickerView.leadingAnchor, constant: -20),
            
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            textField.topAnchor.constraint(equalTo: selectedImageView.bottomAnchor, constant: 50),
            
            addButton.centerXAnchor.constraint(equalTo: textField.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20)
        ])
    }
    
    
}
    
extension AddViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return Model.shared.itemsImageFile.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = UIImage(named: Model.shared.itemsImageFile[row])
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedImageView.image = UIImage(named: Model.shared.itemsImageFile[row])
    }
        
}
