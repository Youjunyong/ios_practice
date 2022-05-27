//
//  Model.swift
//  05.PickerView
//
//  Created by 유준용 on 2022/05/12.
//

import Foundation

struct Model{
    var imageName = Array<String>()
    var count: Int
    
    init() {
        for i in 1...10{
            self.imageName.append(String(i) + ".jpg")
        }
        self.count = imageName.count
    }
}
