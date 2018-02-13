//
//  T_order_details+CoreDataClass.swift
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


@objc(Order_details)
public class Order_details: NSManagedObject , TronManagedObject{
    static func fetchOrCreate( json: JSON) -> TronManagedObject{
        
        let id = json["id"].intValue
        var obj = Order_details.mr_findFirst(with:  NSPredicate.init(format: "pk_i_item_id = %d", id))
        
        if obj == nil
        {
            obj = Order_details.mr_createEntity()
        }
        
        // set attribuate
        
        obj?.pk_i_id = json["id"].int16Value
        obj?.fk_i_order_id = json["userId"].int16Value
        obj?.fk_i_item_id = json["itemid"].int16Value
        
        
        //set relationship
        
        obj?.order = Order.mr_findFirst(byAttribute: "pk_i_id", withValue:  (obj?.fk_i_order_id)!)
        obj?.item = Item.mr_findFirst(byAttribute: "pk_i_id", withValue:  (obj?.fk_i_item_id)!)
        
        
        return obj!
    }
    static func getRootJsonName() -> String {
        return "order"
    }
    

}
