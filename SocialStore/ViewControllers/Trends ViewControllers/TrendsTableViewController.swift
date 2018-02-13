//
//  TrendsTableViewController.swift
//  FinalProject
//
//  Created by iOS-WWB on 7/24/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TrendsTableViewController: UITableViewController, IndicatorInfoProvider {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let CellNib = UINib.init(nibName: "ItemViewCell", bundle: nil)
        self.tableView.register(CellNib, forCellReuseIdentifier: "cell4")
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "TRENDS")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! ItemTableViewCell
        cell.viewController = self
       // print("wjkdkdk")
        return cell
      
        
        // Configure the cell...
        
        
}
}
