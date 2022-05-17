//
//  TableViewCell.swift
//  12.UITableViewController
//
//  Created by 유준용 on 2022/05/17.
//

import UIKit

class TableViewCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let todoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        configureUI()
    }
    private func configureUI(){
        
        contentView.addSubview(todoImageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            todoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            todoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            todoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            todoImageView.widthAnchor.constraint(equalTo: todoImageView.heightAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: todoImageView.trailingAnchor , constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

}
