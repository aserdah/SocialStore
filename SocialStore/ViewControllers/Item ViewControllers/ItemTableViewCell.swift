//
//  ItemTableViewCellController.swift
//  FinalProject
//
//  Created by Ahmed Serdah on 7/22/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lbtext: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var lbview: UILabel!
    @IBOutlet weak var lbfire: UILabel!
    
    var viewController: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func openProfile(_ sender: Any) {
        let vc = viewController?.storyboard?.instantiateViewController(withIdentifier: "trendpagerViewController")
        viewController?.navigationController?.pushViewController(vc!, animated: true)
    }
}
