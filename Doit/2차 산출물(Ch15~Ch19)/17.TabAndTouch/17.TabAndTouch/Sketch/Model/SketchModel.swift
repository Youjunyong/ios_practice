//
//  SketchModel.swift
//  17.TabAndTouch
//
//  Created by 유준용 on 2022/05/20.
//

import Foundation
import UIKit

struct SketchModel {
    var currentLineWidth: CGFloat = 1.0
    var currentLineColor: ColorType = .black
    var currentCgColor: CGColor {
        get{
            switch self.currentLineColor {
            case .red:
                return UIColor.red.cgColor
            case .blue:
                return UIColor.blue.cgColor
            case .black:
                return UIColor.black.cgColor
            }
        }
    }
    
    enum ColorType: Int {
        case red = 100
        case blue = 200
        case black = 300
    }
    
    enum WidthControl: CGFloat {
        case decrease = 400
        case increase = 500
    }

    init(width: CGFloat, color: ColorType){
        self.currentLineWidth = width
        self.currentLineColor = color
    }
}
