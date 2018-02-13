//
//  T_order+CoreDataClass.swift
//  FinalProject
//
//  Created by mahmoud hassouna on 8/2/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import Foundation
import CoreData
import TRON
import SwiftyJSON
import MagicalRecord


@objc(Order)
public class Order: NSManagedObject , TronManagedObject{
    static func fetchOrCreate( json: JSON) -> TronManagedObject{
        
        let id = json["id"].intValue
        var obj = Order.mr_findFirst(with:  NSPredicate.init(format: "pk_i_item_id = %d", id))
        
        if obj == nil
        {
            obj = Order.mr_createEntity()
        }
        
        // set attribuate
        
        obj?.pk_i_id = json["id"].int16Value
        obj?.fk_i_user_id = json["userId"].int16Value
       // obj?.b_enabled
        
        
        
        //set relationship
        
        obj?.user = User.mr_findFirst(byAttribute: "pk_i_user_id", withValue:  (obj?.fk_i_user_id)!)
        
        
        return obj!
    }
    
    static func getRootJsonName() -> String {
        return "order"
    }
    
}
