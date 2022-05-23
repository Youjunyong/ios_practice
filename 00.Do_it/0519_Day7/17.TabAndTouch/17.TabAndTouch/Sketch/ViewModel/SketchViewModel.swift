//
//  ColorSet.swift
//  17.TabAndTouch
//
//  Created by 유준용 on 2022/05/20.
//

import Foundation
import UIKit

struct SketchViewModel{
    var model = SketchModel(width: 1, color: .black)
    
    mutating func changeWidth(width: CGFloat){
        model.currentLineWidth = width
    }
    mutating func changeColor(color: SketchModel.ColorType){
        model.currentLineColor = color
    }
}




// Model: 색상, 두께정보, 그리고 현재 설정된 색상과 두께를 따로 담는 청사진

// ViewModel: View와 연결됨 , Model을 소유한다.

// View(UI): 스케치된 부분을 그리고, 유저 이벤트를 받는다.(색상과 두께 조절)
