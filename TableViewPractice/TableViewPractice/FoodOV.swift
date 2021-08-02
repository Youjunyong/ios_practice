//
//  FoodOV.swift
//  TableViewPractice
//
//  Created by 유준용 on 2021/08/02.
//

import Foundation

class FoodOV{
    
    static var shared = FoodOV()
    private init(){
    }
    var category = ["Chicken", "Pizza"]
    var chicken = ["교촌치킨", "BBQ", "BHC", "맘스터치", "굽네치킨", "네네치킨", "바른치킨", "60계치킨", "노랑통닭", "멕시카나치킨", "자담치킨", "지코바치킨", "호식이두마리치킨", "페리카나", "또래오래", "처갓집양념치킨", "땅땅치킨", "깐부치킨", "멕시칸치킨", "아웃닭", "또봉이통닭"]
    var pizza = ["도미노피자" ,"미스터피자" ,"피자알볼로" ,"피자헛" ,"7번가 피자"]
        
    var pizzaImg = ["RPPZ1517_RPEG0015_pl" , "RPPZ1518_RPEG0003_pl","RPPZ0017_RPEG0003_pl","RPPZ0016_RPEG0003_pl" ,"RPPZ1550_RPEG0016_pl"]
}
