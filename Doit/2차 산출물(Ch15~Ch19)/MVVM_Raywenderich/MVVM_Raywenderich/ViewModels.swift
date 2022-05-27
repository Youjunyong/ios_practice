//
//  ViewModels.swift
//  MVVM_Raywenderich
//
//  Created by 유준용 on 2022/05/23.
//

// MARK: - ViewModel
import UIKit

public class PetViewModel {
  
  // 1. 2개의 Private Property
  private let pet: Pet   // viewModel은 Model을 소유한다.
  private let calendar: Calendar
  
  public init(pet: Pet) {
    self.pet = pet
    self.calendar = Calendar(identifier: .gregorian)
  }
  
  // 2. 2개의 Computed Property 이름과 이미지를 리턴받기 위함
    
//   ????? 모든 애완동물의 이름에 접두사를 추가하도록 디자인을 변경하려는 경우에
//    여기에서 이름을 수정하여 쉽게 변경할 수 있다.
  public var name: String {
    return pet.name
  }
  
  public var image: UIImage {
    return pet.image
  }
  
  // 3. Computed Property
    // 오늘부터 생일까지의 날짜를 계산하여 나이를 포함한 문자열을 반환한다.
  public var ageText: String {
    let today = calendar.startOfDay(for: Date())
    let birthday = calendar.startOfDay(for: pet.birthday)
    let components = calendar.dateComponents([.year],
                                             from: birthday,
                                             to: today)
    let age = components.year!
    return "\(age) years old"
  }
  
  // 4. Computed Proeprty
//    희귀도에 따라 비용을 결정하고, 문자열을 반환하는 프로퍼티이다.
  public var adoptionFeeText: String {
    switch pet.rarity {
    case .common:
      return "$50.00"
    case .uncommon:
      return "$75.00"
    case .rare:
      return "$150.00"
    case .veryRare:
      return "$500.00"
    }
  }
    
    func configure(_ view: PetView){
        view.nameLabel.text = name
        view.imageView.image = image
        view.ageLabel.text = ageText
        view.adoptionFeeLabel.text = adoptionFeeText
    }
  
}
