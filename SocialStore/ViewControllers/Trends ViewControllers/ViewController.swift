//
//  ViewController.swift
//  FinalProject
//
//  Created by iOS-WWB on 7/19/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewController: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var longin: UIButton!
    @IBOutlet weak var create: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     //   create.layer.borderWidth = 1.0
      //  create.layer.borderColor = UIColor.white.cgColor
     //   create.layer.borderColor =
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        // Dispose of any resources that can be recreated.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "My Child title")
    }


}

