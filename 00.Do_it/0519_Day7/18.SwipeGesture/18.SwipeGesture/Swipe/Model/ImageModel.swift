//
//  Model.swift
//  18.SwipeGesture
//
//  Created by 유준용 on 2022/05/20.
//

import Foundation

struct ImageModel {
    var arrowColor: ArrowColor = .black
    var arrowDirection: ArrowDirection = .up
}

enum ArrowColor: String {
    case black , green , red
}

enum ArrowDirection: String {
    case up, down, left, right
}
