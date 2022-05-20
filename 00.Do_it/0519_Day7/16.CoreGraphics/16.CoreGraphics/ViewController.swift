//
//  ViewController.swift
//  16.CoreGraphics
//
//  Created by 유준용 on 2022/05/19.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {

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
        button.addTarget(self, action: #selector(drawLine), for: .touchUpInside)
        return button
    }()
    
    let rectButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("사각형", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(drawRect), for: .touchUpInside)
        return button
    }()
    
    let circleButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("원", for: .normal)
        button.addTarget(self, action: #selector(drawCircle), for: .touchUpInside)
        return button
    }()
    
    let arcButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("호", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(drawArc), for: .touchUpInside)
        return button
    }()
    
    let fillButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("채우기", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(drawFill), for: .touchUpInside)
        return button
    }()
    
    let flowerButton: UIButton = {
        let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.setTitle("꽃", for: .normal)
         button.setTitleColor(UIColor.blue, for: .normal)
         button.addTarget(self, action: #selector(drawFlower), for: .touchUpInside)
         return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureUI()
    }
    
    //MARK: - Method
    @objc func drawLine(){
        print("##")
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        // Draw Line
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.move(to: CGPoint(x: 70, y: 50))
        context?.addLine(to: CGPoint(x: 270, y: 250))
        context?.strokePath()
        
        // Draw triangle
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x: 170, y: 200))
        context?.addLine(to: CGPoint(x:270, y:350))
        context?.addLine(to: CGPoint(x:70, y:350))
        context?.addLine(to: CGPoint(x:170, y:200))
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @objc func drawRect(){
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200))
        context.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @objc func drawCircle(){
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Ellipse
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))
        context.strokePath()
        
        //Draw Circle
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.addEllipse(in: CGRect(x: 70, y: 200, width: 200, height: 200))
        context.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @objc func drawArc(){
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Arc
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        context.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @objc func drawFill(){
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Rectangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor)
        let rectangle = CGRect(x: 70, y: 50, width: 200, height: 100)
        context.addRect((rectangle))
        context.fill(rectangle)
        
        //Draw Circle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.blue.cgColor)
        
        let circle = CGRect(x: 70, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle)
        
        //Draw Triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 350))
        context.addLine(to: CGPoint(x: 270, y: 450))
        context.addLine(to: CGPoint(x: 70, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 350))
        context.fillPath()
        context.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @objc func drawFlower(){
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw triangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 450))
        context.addLine(to: CGPoint(x: 140, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.fillPath()
        
        //Draw Circle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        var circle = CGRect(x: 120, y: 150, width: 100, height: 100)
        context.addEllipse(in: circle)
        
        circle = CGRect(x: 170, y: 150, width: 100, height: 100)
        context.addEllipse(in: circle)
        
        circle = CGRect(x: 80, y: 150, width: 100, height: 100)
        context.addEllipse(in: circle)
        
        circle = CGRect(x: 120, y: 100, width: 100, height: 100)
        context.addEllipse(in: circle)
        
        circle = CGRect(x: 120, y: 200, width: 100, height: 100)
        context.addEllipse(in: circle)
        context.strokePath()
        
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    //MARK: - Confgirue UI
    
    private func configureUI(){
        [lineButton, rectButton, circleButton, arcButton, fillButton, flowerButton].forEach {
            horizontalStackView.addArrangedSubview($0)
        }
        
        [horizontalStackView, imageView].forEach {
            verticalStackView.addArrangedSubview($0)
        }
        view.addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }
    
    
    


}

