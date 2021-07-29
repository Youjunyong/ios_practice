//
//  Result_1.swift
//  AlertNotificationPractice
//
//  Created by 유준용 on 2021/07/27.
//

import UIKit
class Quiz_1: UIViewController {

    @IBOutlet weak var quizLabel: UILabel!
    @IBAction func submit(_ sender: Any) {
        AnswerManager.shared.answerList.append(textFiled.text!)
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBOutlet weak var textFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        quizLabel.text = AnswerManager.shared.quiz[AnswerManager.shared.quizNumber]
        AnswerManager.shared.quizNumber += 1
    }


}
