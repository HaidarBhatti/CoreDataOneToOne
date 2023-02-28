//
//  EmployeeTableViewCell.swift
//  CoreDataOneToOneDemo
//
//  Created by Haidar Bhatti on 27/02/2023.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgEmployee: UIImageView!
    @IBOutlet weak var lblEmployeeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
