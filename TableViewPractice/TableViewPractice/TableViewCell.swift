//
//  TableViewCell.swift
//  TableViewPractice
//
//  Created by 유준용 on 2021/08/02.
//

import UIKit

class TableViewCell: UITableViewCell {

  
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
