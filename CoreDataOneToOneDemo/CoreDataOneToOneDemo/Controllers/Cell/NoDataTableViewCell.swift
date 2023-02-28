//
//  NoDataTableViewCell.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 28/02/2023.
//

import UIKit

class NoDataTableViewCell: UITableViewCell {
    @IBOutlet weak var lblPassportInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
