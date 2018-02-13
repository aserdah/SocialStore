//
//  ExploreTableViewController.swift
//  FinalProject
//
//  Created by Ahmed Serdah on 7/22/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class FeedTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, IndicatorInfoProvider {
    
    @IBOutlet var tableView: UITableView!
   // let model = generateRandomData()
    var storedOffsets = [Int: CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let CellNib = UINib.init(nibName: "ItemViewCell", bundle: nil)
        self.tableView.register(CellNib, forCellReuseIdentifier: "cell1")
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "FEED")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row==3){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
                as! NewProductsTableViewCell
            
            
            
            return cell
        }
        else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! ItemTableViewCell
            cell.viewController = self
            return cell
        }

        // Configure the cell...

        
    }
    
    
}
