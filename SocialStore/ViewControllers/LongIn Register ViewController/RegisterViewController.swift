//
//  RegisterViewController.swift
//  FinalProject
//
//  Created by Ahmed Serdah on 8/10/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var RegisterBtn: CustomButton!
    @IBOutlet weak var LoginName: UITextField!
    @IBOutlet weak var LoginPass: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var LoginPassConfirm: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func EnableRegisterBtn(_ sender: Any) {
         if(LoginPass.text != nil &&
            LoginName.text != nil &&
            LoginPassConfirm.text != nil &&
            Email.text != nil
            ){
            RegisterBtn.backgroundColor = UIColor.blue
            RegisterBtn.isEnabled = true
            
        }
    }
    
    @IBAction func CreateAccountBtnTapped(_ sender: Any) {
      
        if(LoginPass.text==LoginPassConfirm.text){
        RequestWrapper.postUsersRegister(s_email: Email.text ,
                                      s_password: LoginPass.text,
                                      s_nickname: LoginName.text,
                                      i_gender: 1,
                                      s_address: "",
                                      i_pns_type: 1,
                                      s_pns_token: "",
                                      file_avatar: ""
        ) { (tronModel, error) in
            if(tronModel?.status != nil){
                print((tronModel?.status?.message)!)
                //PagerTabViewController
                //let newViewController = PagerTabViewController()
                //self.navigationController?.pushViewController(newViewController, animated: true)
                // let alert = UIAlertController(title: "Login success", message: (tronModel?.status?.message)!, preferredStyle: UIAlertControllerStyle.alert)
                
                
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "LonginViewController") as! LonginViewController
                self.present(newViewController, animated: true, completion: nil)
//                newViewController.showMessage((tronModel?.status?.message)!, type: .success, options: [
//                    .animation(.slide),
//                    .animationDuration(0.3),
//                    .autoHide(true),
//                    .autoHideDelay(3.0),
//                    .height(44.0),
//                    .hideOnTap(true),
//                    .position(.top),
//                    .textAlignment(.center),
//                    .textColor(UIColor.white),
//                    .textNumberOfLines(1),
//                    .textPadding(30.0)
//                    ])
            }
            else{
                print((error?.errorModel?.message)!)
                let alert = UIAlertController(title: "Register Error", message: (error?.errorModel?.message)!, preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
                
            }
            
        }
        }
        else{
            let alert = UIAlertController(title: "Register Error", message: "PassWord Not Confirm", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)

        
        }

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
