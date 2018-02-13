//
//  FilterViewController.swift
//  FinalProject
//
//  Created by Ahmed Serdah and raed bolbol on 8/2/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit
import M13Checkbox

class FilterViewController: UIViewController {
    
    var XSSizeBtnChecked = 0
    var SSizeBtnChecked = 0
    var MSizeBtnChecked = 0
    var LSizeBtnChecked = 0
    var XLSizeBtnChecked = 0
    var BlackColorBtnChecked = 0
    var BrownColorBtnChecked = 0
    var PinkColorBtnChecked = 0
    var MintColorBtnChecked = 0
    var MoveColorBtnChecked = 0
    var YellowColorBtnChecked = 0
    
    @IBOutlet weak var PriceSlider: UISlider!
    @IBOutlet weak var PriceValue: UILabel!

    @IBOutlet weak var MostpopulerChechBox: M13Checkbox!
    @IBOutlet weak var MostViwedChechBox: M13Checkbox!
    @IBOutlet weak var MostRecentChechBox: M13Checkbox!
    @IBOutlet weak var SSizeBtn: CustomButton!
    @IBOutlet weak var XsSizeBtn: CustomButton!
    @IBOutlet weak var MSizeBtn: CustomButton!
    @IBOutlet weak var LSizeBtn: CustomButton!
    @IBOutlet weak var XlSizeBtn: CustomButton!
    @IBOutlet weak var BlackColorBtn: CustomButton!
    @IBOutlet weak var BrownColorBtn: CustomButton!
    @IBOutlet weak var PinkColorBtn: CustomButton!
    @IBOutlet weak var MintColorBtn: CustomButton!
    @IBOutlet weak var MoveColorBtn: CustomButton!
    @IBOutlet weak var YellowColorBtn: CustomButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func XsTaped(_ sender: Any) {
        
        if(XSSizeBtnChecked == 0){
        XsSizeBtn.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
            XSSizeBtnChecked = 1
        }
        else{
            XsSizeBtn.backgroundColor = .clear
            XSSizeBtnChecked = 0
            
            
        }
        
        
    }
    @IBAction func STaped(_ sender: Any) {
        if(SSizeBtnChecked == 0){
            SSizeBtn.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
            SSizeBtnChecked = 1
        }
        else{
            SSizeBtn.backgroundColor = .clear
            SSizeBtnChecked = 0
            
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func MTaped(_ sender: Any) {
        if(MSizeBtnChecked == 0){
            MSizeBtn.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
            MSizeBtnChecked = 1
        }
        else{
            MSizeBtn.backgroundColor = .clear
            MSizeBtnChecked = 0
            
            
        }
    }
    @IBAction func YellowColorTaped(_ sender: Any) {
        if(YellowColorBtnChecked == 0){
           YellowColorBtn.layer.cornerRadius = 15
            YellowColorBtn.layer.borderWidth = 2
            YellowColorBtn.layer.borderColor = UIColor.black.cgColor
            
            //(red: 0, green: 0, blue: 1, alpha: 1)
            YellowColorBtnChecked = 1
        }
        else{
            YellowColorBtn.layer.borderColor = UIColor.clear.cgColor
            YellowColorBtnChecked = 0
            
            
        }
    }
    @IBAction func MoveColorTaped(_ sender: Any) {
        if(MoveColorBtnChecked == 0){
            MoveColorBtn.layer.cornerRadius = 15
            MoveColorBtn.layer.borderWidth = 2
            MoveColorBtn.layer.borderColor = UIColor.black.cgColor
            
            //(red: 0, green: 0, blue: 1, alpha: 1)
            MoveColorBtnChecked = 1
        }
        else{
            MoveColorBtn.layer.borderColor = UIColor.clear.cgColor
            MoveColorBtnChecked = 0
            
            
        }
    }
    
    @IBAction func LTaped(_ sender: Any) {
        if(LSizeBtnChecked == 0){
            LSizeBtn.backgroundColor = UIColor.blue
            LSizeBtnChecked = 1
        }
        else{
            LSizeBtn.backgroundColor = .clear
            LSizeBtnChecked = 0
            
            
        }
    }

    @IBAction func MintColorTaped(_ sender: Any) {
        if(MintColorBtnChecked == 0){
            MintColorBtn.layer.cornerRadius = 15
            MintColorBtn.layer.borderWidth = 2
            MintColorBtn.layer.borderColor = UIColor.black.cgColor
            
            //(red: 0, green: 0, blue: 1, alpha: 1)
            MintColorBtnChecked = 1
        }
        else{
            MintColorBtn.layer.borderColor = UIColor.clear.cgColor
            MintColorBtnChecked = 0
            
            
        }
    }
    @IBAction func XlTaped(_ sender: Any) {
        if(XLSizeBtnChecked == 0){
            XlSizeBtn.backgroundColor = UIColor.blue
            
            //(red: 0, green: 0, blue: 1, alpha: 1)
            XLSizeBtnChecked = 1
        }
        else{
            XlSizeBtn.backgroundColor = .clear
            XLSizeBtnChecked = 0
            
            
        }
    }
    @IBAction func BlackColorTaped(_ sender: Any) {
        
        if(BlackColorBtnChecked == 0){
            BlackColorBtn.layer.cornerRadius = 15
            BlackColorBtn.layer.borderWidth = 2
            BlackColorBtn.layer.borderColor = UIColor.black.cgColor
            
            //(red: 0, green: 0, blue: 1, alpha: 1)
            BlackColorBtnChecked = 1
        }
        else{
            BlackColorBtn.layer.borderColor = UIColor.clear.cgColor
            BlackColorBtnChecked = 0
            
            
        }
      
        
    }
    @IBAction func BrownColorTaped(_ sender: Any) {
        if(BrownColorBtnChecked == 0){
            BrownColorBtn.layer.cornerRadius = 15
            BrownColorBtn.layer.borderWidth = 2
            BrownColorBtn.layer.borderColor = UIColor.black.cgColor
            
            //(red: 0, green: 0, blue: 1, alpha: 1)
            BrownColorBtnChecked = 1
        }
        else{
            BrownColorBtn.layer.borderColor = UIColor.clear.cgColor
            BrownColorBtnChecked = 0
            
            
        }
    }
    @IBAction func PinkColorTaped(_ sender: Any) {
        
        if(PinkColorBtnChecked == 0){
            PinkColorBtn.layer.cornerRadius = 15
            PinkColorBtn.layer.borderWidth = 2
            PinkColorBtn.layer.borderColor = UIColor.black.cgColor
            
            //(red: 0, green: 0, blue: 1, alpha: 1)
            PinkColorBtnChecked = 1
        }
        else{
            PinkColorBtn.layer.borderColor = UIColor.clear.cgColor
            PinkColorBtnChecked = 0
            
            
        }
    }
    
    @IBAction func PriceChanged(_ sender: Any) {
        let selectedValue = String(self.PriceSlider.value)
        
        
        PriceValue.text = selectedValue+" $"
        
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
