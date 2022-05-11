//
//  ViewController.swift
//  04.DatePicker
//
//  Created by 유준용 on 2022/05/11.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var nowTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "현재시간: "
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    lazy var selectedTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "선택시간: "
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY년 MM월 DD일 HH시 mm분 ss초"
        let nowTime = dateFormatter.string(from: Date())
        self
        
        // Do any additional setup after loading the view.
    }

    @objc func dateChanged(_ sender: UIDatePicker){
        
        self.selectedTimeLabel.text = "선택시간: " +
        
        
    }

    private func configureUI(){
        [ nowTimeLabel, selectedTimeLabel, datePicker].forEach{
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            datePicker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),

            selectedTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            selectedTimeLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 100),
            
            nowTimeLabel.bottomAnchor.constraint(equalTo: datePicker.topAnchor, constant: -100),
            nowTimeLabel.leadingAnchor.constraint(equalTo: selectedTimeLabel.leadingAnchor)
            
        ])
    }
}

