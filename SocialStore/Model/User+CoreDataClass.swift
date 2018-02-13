//
//  User+CoreDataClass.swift
//  
//
//  Created by Ahmed Serdah on 8/8/17.
//
//

import Foundation
import CoreData
import TRON
import SwiftyJSON
import MagicalRecord

@objc(User)
public class User: NSManagedObject, TronManagedObject {
    
    static func fetchOrCreate( json: JSON) -> TronManagedObject{
        
        let id = json["id"].intValue
        var obj = User.mr_findFirst(with:  NSPredicate.init(format: "pk_i_user_id = %d", id))
        
        if obj == nil
        {
            obj = User.mr_createEntity()
        }
        
         obj?.pk_i_user_id = json["pk_i_id"].int16Value
         obj?.s_role_name = json["s_nickname"].stringValue
         obj?.i_role_id = json["pk_i_id"].int16Value
         obj?.s_nikename = json["s_nickname"].stringValue
         //obj?.s_note = json["name"].stringValue
         obj?.s_Email = json["s_email"].stringValue
         //obj?.s_Password = json["name"].stringValue
         obj?.i_gender = json["i_gender"].int16Value
        // obj?.s_mobile_number = json["name"].stringValue
         obj?.s_avtar = json["s_avatar"].stringValue
         obj?.s_cover_image = json["s_avatar"].stringValue
         obj?.dt_notification_seen = RequestWrapper.dateFormatter.date(from: json["dt_notification_seen_date"].stringValue) as Date?
         //obj?.s_address = json["name"].stringValue
         obj?.s_access_token = json["s_access_token"].stringValue
         obj?.dt_verfication = RequestWrapper.dateFormatter.date(from: json["dt_verification_date"].stringValue) as Date?
         obj?.i_followers_users_count = json["i_followers_users_count"].int16Value
        // obj?.i_followings_items_count = json["i_followings_users_count"].int16Value
         obj?.i_comments_count = json["i_comments_count"].int16Value
         obj?.i_item_count = json["i_items_count"].int16Value
         //obj?.dt_following_date = RequestWrapper.dateFormatter.date(from: json["dt_modified_date"].stringValue) as NSDate?
        // obj?.d_deleted_date = RequestWrapper.dateFormatter.date(from: json["dt_modified_date"].stringValue) as NSDate?
         obj?.d_modified_date = RequestWrapper.dateFormatter.date(from: json["dt_modified_date"].stringValue) as Date?
         obj?.d_created_date = RequestWrapper.dateFormatter.date(from: json["dt_created_date"].stringValue) as Date?
         obj?.b_enabled  = json["b_enabled"] == true ? 1 : 0
         obj?.i_notifications_count = json["i_notifications_count"].int16Value
         obj?.i_following_users_count = json["i_followings_users_count"].int16Value
        
        
        
        return obj!
    }
    static func getRootJsonName() -> String {
        return "user"
    }
    
    
}
