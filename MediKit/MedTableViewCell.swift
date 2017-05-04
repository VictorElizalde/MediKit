//
//  MedTableViewCell.swift
//  MediKit
//
//  Created by Victor Elizalde on 5/3/17.
//  Copyright © 2017 Victor Elizalde. All rights reserved.
//

import UIKit

class MedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var duracionLabel: UILabel!
    @IBOutlet weak var dosisLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
