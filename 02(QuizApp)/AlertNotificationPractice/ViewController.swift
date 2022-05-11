//
//  ViewController.swift
//  AlertNotificationPractice
//
//  Created by 유준용 on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func imagePicker(_ sender: Any) {
        guard let imgVC = self.storyboard?.instantiateViewController(withIdentifier: "ImagePickerViewController") as? ImagePickerViewController else{return}
        present(imgVC, animated: true, completion: nil)

    }
    
    
    @IBAction func btn(_ sender: Any) {
        guard let quizVC = self.storyboard?.instantiateViewController(withIdentifier: "QuizController") as? QuizController else {
            return
        }
        self.navigationController?.pushViewController(quizVC, animated: true)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

