//
//  SlideMenuTableViewCell.swift
//  FinalProject
//
//  Created by Ahmed Serdah on 8/11/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit

class SlideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var SildeMenuItemName: UILabel!
    @IBOutlet weak var SildeMenuItemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
