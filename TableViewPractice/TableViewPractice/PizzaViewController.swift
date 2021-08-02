//
//  PizzaViewController.swift
//  TableViewPractice
//
//  Created by 유준용 on 2021/08/02.
//

import UIKit

class PizzaViewController: UIViewController {

    @IBOutlet weak var pizzaTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pizzaTableView.delegate = self
        pizzaTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
}
extension PizzaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoodOV.shared.pizza.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pizzaTableView.dequeueReusableCell(withIdentifier: "pizzaCell") as! TableViewCell
        cell.nameLabel.text =  FoodOV.shared.pizza[indexPath.row]
        cell.priceLabel.text = String(Int.random(in: 100...400) * 100) + "Won"
        let url = URL(string: "https://akamai.pizzahut.co.kr/2020pizzahut-prod/public/img/menu/"+FoodOV.shared.pizzaImg[indexPath.row]+".png")
        
        DispatchQueue.global().async { let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async { cell.imgView.image = UIImage(data: data!) }}
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}
