//
//  SideMenuViewController.swift
//  FinalProject
//
//  Created by Ahmed Serdah on 8/11/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var editProfuleLabel: UILabel!
    
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var ProfileNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
         print("wellcome")
        ProfileNameLabel.text = User.mr_findFirst()?.s_nikename
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.editProfuleLabelTapped(_:)))
        tap.numberOfTapsRequired = 1
        
        editProfuleLabel.isUserInteractionEnabled = true
        editProfuleLabel.addGestureRecognizer(tap)
        
        let ProfileImageTap = UITapGestureRecognizer(target: self, action: #selector(self.ProfileImageTapped(_:)))
        ProfileImageTap.numberOfTapsRequired = 1
       
        ProfileImage.isUserInteractionEnabled = true
        ProfileImage.addGestureRecognizer(ProfileImageTap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func editProfuleLabelTapped(_ recognizer: UITapGestureRecognizer) {
        
        let alert = UIAlertController(title: "Error", message: "Not implemented", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        

        
    }
    
    func ProfileImageTapped(_ recognizer: UITapGestureRecognizer) {
        
        let alert = UIAlertController(title: "Error", message: "Not implemented", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        

        
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
  
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SlideMenuCell", for: indexPath) as! SlideMenuTableViewCell
       // cell.SildeMenuItemName.text = "SHOP"
       // cell.SildeMenuItemImage.image =  UIImage(named: "ico_basket")
        
      
        if(indexPath.row == 0){
            cell.SildeMenuItemName.text = "SHOP"
            cell.SildeMenuItemImage.image =  UIImage(named: "ico_basket")
            
        }
        else if(indexPath.row == 1){
            cell.SildeMenuItemName.text = "WHISLIST"
            cell.SildeMenuItemImage.image =  UIImage(named: "ico_wishlist")
            
                   }
        else if(indexPath.row == 2){
            cell.SildeMenuItemName.text = "EXPLORE"
            cell.SildeMenuItemImage.image =  UIImage(named: "ico_explore")
                    }
        else if(indexPath.row == 3){
            cell.SildeMenuItemName.text = "ORDER"
            cell.SildeMenuItemImage.image =  UIImage(named: "ico_order")
           
        }
        else if(indexPath.row == 4){
            cell.SildeMenuItemName.text = "COMMENT"
            cell.SildeMenuItemImage.image =  UIImage(named: "ico_comment_2")
            
                    }
        else if(indexPath.row == 5){
            cell.SildeMenuItemName.text = "SEARCH"
            cell.SildeMenuItemImage.image =  UIImage(named: "ico_search")
            
            
        }
    
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let navViewController = UIApplication.shared.delegate!.window!!.rootViewController as! UINavigationController

        
        print("row selcted \(indexPath.row)" )
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
       
       
     if(indexPath.row == 0){
            let alert = UIAlertController(title: "Error", message: "Not implemented", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            
        }
        else if(indexPath.row == 1){
            
            let newViewController = trendpagerViewController()
        navViewController.pushViewController(newViewController, animated: true)
        self.dismiss(animated: true, completion: nil)
        }
        else if(indexPath.row == 2){
//        let newViewController = PagerTabViewController()
//        navViewController.pushViewController(newViewController, animated: true)
        self.dismiss(animated: true, completion: nil)
        }
        else if(indexPath.row == 3){
            let newViewController = CartTableViewController()
        navViewController.pushViewController(newViewController, animated: true)
        self.dismiss(animated: true, completion: nil)
        }
        else if(indexPath.row == 4){
            
            let newViewController = CommentsTableViewController()
   
        navViewController.pushViewController(newViewController, animated: true)
        self.dismiss(animated: true, completion: nil)
        }
        else if(indexPath.row == 5){
//        let rootViewController = UIApplication.shared.delegate!.window!!.rootViewController
//        let newViewController = LonginViewController()
//        rootViewController?.present(newViewController, animated: true, completion: nil)
//        
//        self.dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: "Error", message: "Not implemented", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        
        }
    
        

       
    }
    
}

