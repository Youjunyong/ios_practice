//
//  Model.swift
//  MVVM_Raywenderich
//
//  Created by 유준용 on 2022/05/23.
//

import Foundation
import UIKit

// MARK: - Model
public class Pet {
  public let name: String
  public let birthday: Date
  public let rarity: Rarity
  public let image: UIImage
  
  public init(name: String,
              birthday: Date,
              rarity: Rarity,
              image: UIImage) {
    self.name = name
    self.birthday = birthday
    self.rarity = rarity
    self.image = image
  }
}

public enum Rarity {
  case common, uncommon, rare, veryRare
}
