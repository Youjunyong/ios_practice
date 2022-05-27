//
//  ViewController.swift
//  04.DatePicker
//
//  Created by 유준용 on 2022/05/11.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Property
    var selectedTime: String?
    
    //MARK: - UI Components
    lazy var nowTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "현재시간: "
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    lazy var selectedTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "선택시간: "
        label.font = .systemFont(ofSize: 15, weight: .bold)
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
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        timeUpdate()
    }

    //MARK: - Method
//    현재시간 초 단위 업데이트
    private func timeUpdate(){
        func checkAlarm(nowTime: String){
            if self.selectedTime != nil, self.selectedTime == nowTime{
                view.backgroundColor = .red
            }else{
                view.backgroundColor = .white
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            let dateFormatter = DateFormatter()
            let date = Date()
            dateFormatter.dateFormat = "YYYY년 MM월 d일 E요일 HH시 mm분 ss초"
            let nowTime = dateFormatter.string(from: date)
            self?.nowTimeLabel.text = "현재시간: " + nowTime
            
            dateFormatter.dateFormat = "YYYY년 MM월 d일 E요일 HH시 mm분"
            checkAlarm(nowTime: dateFormatter.string(from: date))
        }
    }
    
//    DatePicker Event
    @objc func dateChanged(_ sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY년 MM월 d일 E요일 HH시 mm분"
        self.selectedTime = dateFormatter.string(from: sender.date)
        self.selectedTimeLabel.text = "선택시간: " + (selectedTime ?? "")
    }

    //MARK: - Configure UI
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

