//
//  ViewController.swift
//  10.UITabBarController
//
//  Created by 유준용 on 2022/05/13.
//

import UIKit

class ViewController: UIViewController {
    var selectedTime: String?

    let imageViewPageButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("이미지뷰 보기", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(goImageView(_:)), for: .touchUpInside)
        return btn
    }()
    
    let pickerViewPageButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("피커뷰 보기", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(goPickerView(_:)), for: .touchUpInside)
        return btn
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView ()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.contentMode = .scaleAspectFit
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "File")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let pickerPageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
     
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configurePickerView()
        configureImageView()
        timeUpdate()
        
    }
    
    private func timeUpdate(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            let dateFormatter = DateFormatter()
            let date = Date()
            dateFormatter.dateFormat = "YYYY년 MM월 d일 E요일 HH시 mm분 ss초"
            let nowTime = dateFormatter.string(from: date)
            self?.nowTimeLabel.text = "현재시간: " + nowTime
            dateFormatter.dateFormat = "YYYY년 MM월 d일 E요일 HH시 mm분"
        }
    }
    
    @objc func goPickerView(_ sender: UIButton){
        self.pickerPageView.isHidden = false
        self.imageView.isHidden = true
    }
    
    @objc func goImageView(_ sender: UIButton){
        self.pickerPageView.isHidden = true
        
        self.imageView.isHidden = false
    }
    
    @objc func dateChanged(_ sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY년 MM월 d일 E요일 HH시 mm분"
        self.selectedTime = dateFormatter.string(from: sender.date)
        self.selectedTimeLabel.text = "선택시간: " + (selectedTime ?? "")
    }

    private func configureImageView(){
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func configurePickerView(){
        view.addSubview(pickerPageView)
        
        NSLayoutConstraint.activate([
            pickerPageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pickerPageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pickerPageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pickerPageView.topAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
        
        [ nowTimeLabel, selectedTimeLabel, datePicker].forEach{
            pickerPageView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: pickerPageView.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: pickerPageView.trailingAnchor),
            datePicker.topAnchor.constraint(equalTo: pickerPageView.topAnchor, constant: 100),
            datePicker.bottomAnchor.constraint(equalTo: pickerPageView.bottomAnchor, constant: -100),

            selectedTimeLabel.leadingAnchor.constraint(equalTo: pickerPageView.leadingAnchor, constant: 30),
            selectedTimeLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 50),
            
            nowTimeLabel.bottomAnchor.constraint(equalTo: datePicker.topAnchor, constant: -50),
            nowTimeLabel.leadingAnchor.constraint(equalTo: selectedTimeLabel.leadingAnchor)
        ])
    }
    
    private func configureUI(){
        stackView.addArrangedSubview(imageViewPageButton)
        stackView.addArrangedSubview(pickerViewPageButton)
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            stackView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}


