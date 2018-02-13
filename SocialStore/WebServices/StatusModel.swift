//
//  ErrorModel.swift
//  TronExample
//
//  Created by Training on 7/6/17.
//  Copyright © 2017 example. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

class StatusModel: NSObject, JSONDecodable {
    
    var success: Bool?
    var code: Int?
    var message: String?
    
    required init(json: JSON) {
        success = json["status"]["success"].boolValue
        code = json["status"]["code"].intValue
        message = json["status"]["message"].stringValue
    }
}
