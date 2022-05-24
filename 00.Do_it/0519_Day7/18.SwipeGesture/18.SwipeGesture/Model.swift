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
    
    // 위 방향 화살표 image
    let BLACK_UP = "arrow-up-black"
    let RED_UP = "arrow-up-red"
    let GREEN_UP = "arrow-up-green"
    
    // down
    let BLACK_DOWN = "arrow-down-black"
    let RED_DOWN = "arrow-down-red"
    let GREEN_DOWN = "arrow-down-green"
    
    // left
    let BLACK_LEFT = "arrow-left-black"
    let RED_LEFT = "arrow-left-red"
    let GREEN_LEFT = "arrow-left-green"
    
    // right
    let BLACK_RIGHT = "arrow-right-black"
    let RED_RIGHT = "arrow-right-red"
    let GREEN_RIGHT = "arrow-right-green"
}

enum ArrowColor {
    case black, green, red
}

enum ArrowDirection {
    case up, down, left, right
}
