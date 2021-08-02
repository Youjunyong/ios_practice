//
//  ChickenViewController.swift
//  TableViewPractice
//
//  Created by 유준용 on 2021/08/02.
//

import UIKit

class ChickenViewController: UIViewController {

    @IBOutlet weak var rankTableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankTableView.delegate = self
        rankTableView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}
extension ChickenViewController: UITableViewDelegate, UITableViewDataSource{
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
       return ["S.I.T"] // Section Index Title
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionTitle: String?
        if tableView == rankTableView {
            sectionTitle = "best 3"
        }else{
            sectionTitle = "nomal"
        }
        
        return sectionTitle
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == rankTableView {
            return 3
        }
        else {
            return FoodOV.shared.chicken.count - 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == rankTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rank")!
            let name = cell.viewWithTag(20) as? UILabel
            name?.text = FoodOV.shared.chicken[indexPath.row]
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "nomal")!
            let name = cell.viewWithTag(10) as? UILabel
            name?.text = FoodOV.shared.chicken[indexPath.row + 3]
            return cell
        }
    
    }
    
}

