//
//  LonginViewController.swift
//  FinalProject
//
//  Created by Ahmed Serdah on 8/10/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit
import GSMessages

class LonginViewController: UIViewController {

    @IBOutlet weak var UserNameText: UITextField!
    @IBOutlet weak var PassWordText: UITextField!
    override func viewDidLoad() {
     
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    @IBAction func LoginBtnTapped(_ sender: Any) {
     //   "a@a.com" "123456"
        RequestWrapper.postUsersLogin(s_email: UserNameText.text ,
                                      s_password: PassWordText.text
        ) { (tronModel, error) in
            if(tronModel?.status != nil){
            print((tronModel?.status?.message)!)
                //PagerTabViewController
                //let newViewController = PagerTabViewController()
                //self.navigationController?.pushViewController(newViewController, animated: true)
               // let alert = UIAlertController(title: "Login success", message: (tronModel?.status?.message)!, preferredStyle: UIAlertControllerStyle.alert)
                
          
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "NavigationView") as! UINavigationController
                self.present(newViewController, animated: true, completion: nil)
               // newViewController.showMessage((tronModel?.status?.message)!, type: .success, options: [.animation(.slide),.animationDuration(0.3),.autoHide(true),.autoHideDelay(3.0),.height(44.0),.hideOnTap(true),.position(.top),.textAlignment(.center),.textColor(UIColor.white),.textNumberOfLines(1), .textPadding(30.0)])
                
          
            }
            else{
            print((error?.errorModel?.message)!)
                let alert = UIAlertController(title: "Login Error", message: (error?.errorModel?.message)!, preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
                
            }
            
        }
        
    }
    
    // MARK: - Navigation




 }
