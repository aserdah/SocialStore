//
//  TronArrayManagedModel.swift
//  TronExample
//
//  Created by Training on 7/13/17.
//  Copyright © 2017 example. All rights reserved.
//

import UIKit

import UIKit
import TRON
import SwiftyJSON
import MagicalRecord
import CoreData


//extension NSManagedObject {
//    static func fetchOrCreate(json: JSON) -> NSManagedObject? {
//        return nil
//    }
//}

protocol TronManagedObject {
    static func fetchOrCreate(json: JSON) -> TronManagedObject
    
    static func getRootJsonName() -> String
}


class TronArrayManagedModel<Element>: JSONDecodable where Element: TronManagedObject {
    
    var status : StatusModel?
    var objects = [Element]()
    
    required init(json: JSON) {
        self.status = StatusModel(json: json)
        
        let jsonArray = json[Element.getRootJsonName()]
        if (jsonArray.array?.count == 0) { return }
        
        for dic in jsonArray.array! {
            let obj = Element.fetchOrCreate(json: dic) as! Element
            objects.append(obj)
        }
        try! NSManagedObjectContext.mr_contextForCurrentThread().save()
        try! NSManagedObjectContext.mr_default().save()
        try! NSManagedObjectContext.mr_rootSaving().save()
    }
}

