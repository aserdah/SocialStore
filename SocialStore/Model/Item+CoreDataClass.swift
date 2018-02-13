//
//  T_item+CoreDataClass.swift
//  
//
//  Created by mahmoud hassouna on 8/1/17.
//
//

import Foundation
import CoreData
import TRON
import SwiftyJSON
import MagicalRecord


@objc(Item)
public class Item: NSManagedObject , TronManagedObject{
    static func fetchOrCreate( json: JSON) -> TronManagedObject{
        
        let id = json["id"].intValue
        var obj = Item.mr_findFirst(with:  NSPredicate.init(format: "pk_i_item_id = %d", id))
        
        if obj == nil
        {
            obj = Item.mr_createEntity()
        }
        
        // set attribuate
        
        obj?.pk_i_item_id = json["id"].int16Value
        obj?.fk_i_user_id = json["userId"].int16Value
        obj?.s_title = json["title"].stringValue
        obj?.s_details = json["body"].stringValue
        obj?.fk_i_category_id = json["category"].int16Value
        
        
        //set relationship
        
        obj?.user = User.mr_findFirst(byAttribute: "pk_i_user_id", withValue:  (obj?.fk_i_user_id)!)
        obj?.category = Category.mr_findFirst(byAttribute: "pk_i_id", withValue:  (obj?.fk_i_category_id)!)
        
        
        return obj!
    }
    
    
    static func getRootJsonName() -> String {
        return "item"
    }

    
}
