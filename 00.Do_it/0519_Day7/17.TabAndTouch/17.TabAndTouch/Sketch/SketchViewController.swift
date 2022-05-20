//
//  SketchVC.swift
//  17.TabAndTouch
//
//  Created by 유준용 on 2022/05/20.
//

import UIKit

class SketchVC: UIViewController {
    
    //MARK: - Properties
    let sketchView = SketchView()
    let viewModel = SketchViewModel()
    var lastPoint: CGPoint!
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.red.cgColor
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configure()
    }
    
    //MARK: - 화면 전환
    @objc func backToBerforeVC(){
        self.presentingViewController?.dismiss(animated: true)
    }
    
    //MARK: - Touch Event & Sketch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        lastPoint = touch.location(in: sketchView.imageView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(sketchView.imageView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currentPoint = touch.location(in: sketchView.imageView)
        sketchView.imageView.draw(CGRect(x: 0, y: 0, width: sketchView.imageView.frame.size.width, height: sketchView.imageView.frame.size.height))
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        sketchView.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(sketchView.imageView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        sketchView.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: sketchView.imageView.frame.size.width, height: sketchView.imageView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        sketchView.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @objc func clear(){
        sketchView.imageView.image = nil
    }
    
    //MARK: - Motion Event
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            sketchView.imageView.image = nil
        }
    }
    
    //MARK: - Configure
    private func configure(){
        sketchView.translatesAutoresizingMaskIntoConstraints = false
        sketchView.dismissButton.addTarget(self, action: #selector(backToBerforeVC), for: .touchUpInside)
        sketchView.clearButton.addTarget(self, action: #selector(clear), for: .touchUpInside)
        self.view.addSubview(sketchView)
        NSLayoutConstraint.activate([
            sketchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            sketchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            sketchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            sketchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
