//
//  DetailViewController.swift
//  12.UITableViewController
//
//  Created by 유준용 on 2022/05/17.
//

import UIKit

class DetailViewController: UIViewController {
    
    var row: Int? = nil
    
    let itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(itemLabel)
        NSLayoutConstraint.activate([
            itemLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
        
        itemLabel.text = Model.shared.items[row!]
    }
    
    
}
