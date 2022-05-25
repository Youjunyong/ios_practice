//
//  ColorSet.swift
//  17.TabAndTouch
//
//  Created by 유준용 on 2022/05/20.
//

import Foundation
import UIKit

//MARK: - ViewModel
class SketchViewModel{
    var model = SketchModel(width: 1, color: .black)
    
    func changeWidth(width: CGFloat){
        model.currentLineWidth = width
    }
    
    func changeColor(color: SketchModel.ColorType){
        model.currentLineColor = color
    }
    
    func widthInc(){
        self.model.currentLineWidth += 1
    }
    
    func widthDec(){
        if self.model.currentLineWidth > 1 {
            self.model.currentLineWidth -= 1
        }
    }
    
    enum BtnType {
        case increase, decrease
    }
}
