//
//  ViewController.swift
//  12.UITableViewController
//
//  Created by 유준용 on 2022/05/16.
//

import UIKit

class ViewController: UIViewController {

    var model = Model.shared

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.title = "Main View"
        configureTableView()
        configureNaviItem()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    @objc func edit(){
        
    }
    
    @objc func add(){
        let addVC = AddViewController() 
        addVC.addTodo = { todo in
            print(todo)
        }
        self.navigationController?.pushViewController(addVC, animated: true)
        
    }
    private func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        [tableView].forEach {
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    private func configureNaviItem(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(add))
        let editButton = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(edit))
        editButton.title = "Edit"
        self.navigationItem.leftBarButtonItem = editButton
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell else{return UITableViewCell()}
        
        cell.titleLabel.text = model.items[indexPath.row]
        cell.todoImageView.image = UIImage(named: model.itemsImageFile[indexPath.row])
        return cell
    }
}

