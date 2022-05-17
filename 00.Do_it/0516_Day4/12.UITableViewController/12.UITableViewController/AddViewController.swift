//
//  AddViewController.swift
//  12.UITableViewController
//
//  Created by 유준용 on 2022/05/17.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    
    
    var addTodo: ((String) -> ())?
    
    let pickerView: UIPickerView = {
       let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.contentMode = .scaleAspectFit
        return pickerView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let addButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Add", for: .normal)
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
        let todo = self.textField.text
        self.addTodo!(todo!)
    }
    
    private func configureUI(){
        [textField, pickerView].forEach {
            view.addSubview($0)
        }
        pickerView.dataSource = self

        NSLayoutConstraint.activate([
            
        ])
    }
    
    
}
