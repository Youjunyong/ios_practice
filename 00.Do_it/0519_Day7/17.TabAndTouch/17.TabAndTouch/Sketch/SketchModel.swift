//
//  SketchModel.swift
//  17.TabAndTouch
//
//  Created by 유준용 on 2022/05/20.
//

import Foundation
import UIKit

struct SketchModel {
    var currentLineWidth: Int = 1
    var currentLineColor: UIColor = UIColor.black
    
    init(width: Int, color: UIColor){
        self.currentLineWidth = width
        self.currentLineColor = color
    }
}
