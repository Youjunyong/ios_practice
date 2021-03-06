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
    var viewModel = SketchViewModel()
    var lastPoint: CGPoint!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configure()
    }
    
    //MARK: - Dismiss
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
        UIGraphicsGetCurrentContext()?.setStrokeColor(viewModel.model.currentCgColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(viewModel.model.currentLineWidth)
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
        UIGraphicsGetCurrentContext()?.setStrokeColor(viewModel.model.currentCgColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(viewModel.model.currentLineWidth)
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
    
    @objc func setColor(_ sender: UIButton){
        let colorType = SketchModel.ColorType.init(rawValue: sender.tag)!
        viewModel.changeColor(color: colorType)
        sketchView.colorLabel.text = "색: \(colorType)"
    }
    
    @objc func setWidth(_ sender: UIButton){
        let widthControl = SketchModel.WidthControl(rawValue: CGFloat(sender.tag))
        switch widthControl {
        case .increase:
            viewModel.widthInc()
        case .decrease:
            viewModel.widthDec()
        case .none:
            return
        }
        sketchView.widthLabel.text = "두께: \(viewModel.model.currentLineWidth)"
    }
    
    //MARK: - Motion Shake Event
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            clear()
        }
    }
    
    //MARK: - Configure
    private func configure(){
        sketchView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sketchView)
        sketchView.dismissButton.addTarget(self, action: #selector(backToBerforeVC), for: .touchUpInside)
        sketchView.clearButton.addTarget(self, action: #selector(clear), for: .touchUpInside)
        sketchView.redButton.addTarget(self, action: #selector(setColor(_:)), for: .touchUpInside)
        sketchView.blueButton.addTarget(self, action: #selector(setColor(_:)), for: .touchUpInside)
        sketchView.blackButton.addTarget(self, action: #selector(setColor(_:)), for: .touchUpInside)
        sketchView.widthDecButton.addTarget(self, action: #selector(setWidth(_:)), for: .touchUpInside)
        sketchView.widthIncButton.addTarget(self, action: #selector(setWidth(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            sketchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            sketchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            sketchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            sketchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
