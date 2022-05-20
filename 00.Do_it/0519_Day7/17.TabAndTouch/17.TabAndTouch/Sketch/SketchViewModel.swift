//
//  ColorSet.swift
//  17.TabAndTouch
//
//  Created by 유준용 on 2022/05/20.
//

import Foundation
import UIKit

struct SketchViewModel{
    var model = SketchModel(width: 1, color: UIColor.black)
    
    mutating func changeWidth(width: Int){
        model.currentLineWidth = width
    }
    
    mutating func changeColor(color: UIColor){
        model.currentLineColor = color
    }
}
