//
//  Model.swift
//  12.UITableViewController
//
//  Created by 유준용 on 2022/05/17.
//

import Foundation

struct Model {
    static var shared = Model()
    var items = ["책 구매", "철수와 약속", "스터디 준비"]
    var itemsImageFile = ["cart", "clock", "pencil"]
}
