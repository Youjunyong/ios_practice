//
//  AnswerManager.swift
//  AlertNotificationPractice
//
//  Created by 유준용 on 2021/07/29.
//

import Foundation

class AnswerManager{
    static var shared = AnswerManager()
    private init(){
    }
    var quizNumber = 0
    var answerList = [String]()
    var quizScore = 0
    
    let answerCorrect = ["MODAL", "VIEWDIDLOAD", "ARC", "DELEGATE"]
    let quiz = ["창이 닫히기 전에는 해당 창의 영역을 제외한 나머지 부분은 반응할 수 없도록 잠기는 것을 의미하는 단어는?", "뷰 컨트롤러 클래스가 생성될 때, 가장 먼저 실행되며, 딱 한번 실행되는 메소드는?", "자동 참조 계수를 뜻하며, 인스턴스가 더 이상 필요없을 때 사용된 메모리를 자동으로 해제해준다.", "객체의 일부 동작을 다른 객체에 위임하는 디자인 패턴은?"]
    
    
    func upperAll(answerList: Array<String>)->Array<String>{
        var upperList = [String]()
        if quizNumber != 0 {
            for i in 0...quizNumber - 1 {
                upperList.append(answerList[i].uppercased())
                print(i)
            }
        }
        return upperList
    }
    
    func returnScore()->Double{
        answerList = upperAll(answerList: answerList)
        if quizNumber != 0{
            let idx = quizNumber-1
            if answerList[idx] == answerCorrect[idx] {
                quizScore += 1
            }
        }
        return Double(quizScore)/Double(quiz.count)*100
    }
}
