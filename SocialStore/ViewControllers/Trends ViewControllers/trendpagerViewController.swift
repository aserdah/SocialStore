//
//  trendpagerViewController.swift
//  test
//
//  Created by mahmoud hassouna on 7/25/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import HexColors

class trendpagerViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = UIColor("#2e343e")        //settings.style.selectedBarBackgroundColor = .red
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.darkGray //UIColor.init(red: 109, green: 113, blue: 120, alpha: 1.0)
            newCell?.label.textColor = .white
        }

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let vc1 =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemCollectionViewController")
        let vc2 =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ItemCollectionViewController")
        return [vc1, vc2]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
