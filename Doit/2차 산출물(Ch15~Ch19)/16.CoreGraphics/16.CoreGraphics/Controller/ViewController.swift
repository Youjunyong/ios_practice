//
//  ViewController.swift
//  16.CoreGraphics
//
//  Created by 유준용 on 2022/05/19.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    
    let drawView = DrawView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureUI()
        configureDrawAction()   
    }

    //MARK: - Draw Figure Method
    @objc func drawLine(){
        UIGraphicsBeginImageContext(drawView.imageView.frame.size)
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
        drawView.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @objc func drawRect(){
        UIGraphicsBeginImageContext(drawView.imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        //Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200))
        context.strokePath()
        drawView.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @objc func drawCircle(){
        UIGraphicsBeginImageContext(drawView.imageView.frame.size)
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
        drawView.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @objc func drawArc(){
        UIGraphicsBeginImageContext(drawView.imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        //Draw Arc
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        context.strokePath()
        drawView.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @objc func drawFill(){
        UIGraphicsBeginImageContext(drawView.imageView.frame.size)
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
        drawView.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

    @objc func drawFlower(){
        UIGraphicsBeginImageContext(drawView.imageView.frame.size)
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
        drawView.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    private func configureDrawAction(){
        drawView.rectButton.addTarget(self, action: #selector(drawRect), for: .touchUpInside)
        drawView.lineButton.addTarget(self, action: #selector(drawLine), for: .touchUpInside)
        drawView.arcButton.addTarget(self, action: #selector(drawArc), for: .touchUpInside)
        drawView.flowerButton.addTarget(self, action: #selector(drawFlower), for: .touchUpInside)
        drawView.fillButton.addTarget(self, action: #selector(drawFill), for: .touchUpInside)
        drawView.circleButton.addTarget(self, action: #selector(drawCircle), for: .touchUpInside)
    }
    
    private func configureUI(){
        drawView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(drawView)
        NSLayoutConstraint.activate([
            drawView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            drawView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            drawView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            drawView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
