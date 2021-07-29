//
//  Quiz.swift
//  AlertNotificationPractice
//
//  Created by 유준용 on 2021/07/27.
//

import UIKit
class QuizController: UIViewController {
    var totalScore : String = "0"
    @IBOutlet weak var scoreLabel: UILabel!
    var quiz1Answer : String?
    @IBOutlet weak var Label_1: UILabel!
    @IBAction func quiz_1(_ sender: Any) {
        if AnswerManager.shared.quizNumber == AnswerManager.shared.quiz.count {
            let alert = UIAlertController(title: "퀴즈 종료", message: "\(totalScore)점 입니다.", preferredStyle: UIAlertController.Style.alert)
            let cancel = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel) // 버튼생성
            alert.addAction(cancel)
            self.present(alert, animated: true)
            return
        }
        guard let QuizVC1 = self.storyboard?.instantiateViewController(identifier: "Quiz_1") as? Quiz_1 else{return}
        QuizVC1.modalPresentationStyle = .fullScreen
        present(QuizVC1, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        totalScore = String(Int(AnswerManager.shared.returnScore()))
        scoreLabel.text = "Score : \(totalScore) !!"
        print("VEIWWILLAPPEAR")
        
    }
}
