//
//  T_category+CoreDataClass.swift
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


@objc(Category)
public class Category: NSManagedObject, TronManagedObject {
    static func fetchOrCreate( json: JSON) -> TronManagedObject{
        
        let id = json["id"].intValue
        var obj = Category.mr_findFirst(with:  NSPredicate.init(format: "pk_i_item_id = %d", id))
        
        if obj == nil
        {
            obj = Category.mr_createEntity()
        }
        
        // set attribuate
//        "pk_i_id": 1,
//        "s_name": "Clothing",
//        "i_sort": 0,
//        "i_items_count": "0",
//        "b_enabled": true,
//        "dt_created_date": "2017-08-03 00:00:00"
        obj?.pk_i_id = json["pk_i_id"].int16Value
        obj?.s_name = json["s_name"].stringValue
        obj?.i_item_count = json["i_items_count"].int16Value
        
        
        return obj!
    }
    static func getRootJsonName() -> String {
        return "category"
    }
    

}
