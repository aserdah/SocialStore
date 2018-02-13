//
//  CustomButton.swift
//  finalProj
//
//  Created by MinaCom on 7/19/17.
//  Copyright © 2017 MinaCom. All rights reserved.
//

import UIKit
@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat{
        set{
            self.layer.cornerRadius = newValue
        }
        get{
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        set{
            self.layer.borderColor = newValue.cgColor
        }
        get{
            return UIColor(cgColor: self.layer.borderColor!)
        }
        
        
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     self.layer.borderWidth = 2.0
     self.layer.borderColor = UIColor.white as! CGColor
     
     }
     */
    
    
}
