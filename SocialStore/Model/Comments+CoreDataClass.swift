//
//  T_comments+CoreDataClass.swift
//  FinalProject
//
//  Created by mahmoud hassouna on 8/1/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import Foundation
import CoreData
import TRON
import SwiftyJSON
import MagicalRecord


@objc(Comments)
public class Comments: NSManagedObject , TronManagedObject{
    static func fetchOrCreate( json: JSON) -> TronManagedObject{
        
        let id = json["id"].intValue
        var obj = Comments.mr_findFirst(with:  NSPredicate.init(format: "pk_i_item_id = %d", id))
        
        if obj == nil
        {
            obj = Comments.mr_createEntity()
        }
        
        // set attribuate
        
        obj?.pk_i_id = json["comment_id"].int16Value
        obj?.fk_i_user_id = json["userId"].int16Value
        obj?.fk_i_item_id = json["item_id"].int16Value
        obj?.s_details = json["s_details"].stringValue
        
        
        //set relationship
        
        obj?.user = User.mr_findFirst(byAttribute: "pk_i_user_id", withValue:  (obj?.fk_i_user_id)!)
        obj?.item = Item.mr_findFirst(byAttribute: "pk_i_item_id", withValue:  (obj?.fk_i_item_id)!)
        
        
        return obj!
    }
    static func getRootJsonName() -> String {
        return "comment"
    }
    
    

}
