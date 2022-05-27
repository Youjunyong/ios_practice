//
//  Model.swift
//  06.UIAlert
//
//  Created by 유준용 on 2022/05/12.
//

import Foundation
import UIKit

struct Lamp {
    let onImage = UIImage(named: "lamp-on")
    let offImage = UIImage(named: "lamp-off")
    let removeImage = UIImage(named: "lamp-remove")
}

enum Act {
    case on
    case off
    case remove
}
