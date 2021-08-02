//
//  ViewController.swift
//  TableViewPractice
//
//  Created by 유준용 on 2021/08/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let data = FoodOV.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data.category[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pageNum = indexPath.row
        switch pageNum {
        case 0:
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "\(pageNum)Page") as? ChickenViewController else{return}
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 1:
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "\(pageNum)Page") as? PizzaViewController else{return}
            self.navigationController?.pushViewController(nextVC, animated: true)
         
        default:
            return
        }
        
    }
    
    
}
