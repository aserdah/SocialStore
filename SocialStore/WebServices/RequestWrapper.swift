//
//  RequestWrapper.swift
//  NetworkExample
//
//  Created by Training on 7/3/17.
//  Copyright © 2017 example. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON
import Alamofire
import MagicalRecord
import CryptoSwift

class RequestWrapper: NSObject {
    
    static let dateFormatter = { () -> DateFormatter in 
        let df = DateFormatter()
        df.dateFormat = "yyy-MM-dd HH:mm:ss"
        df.timeZone = TimeZone(secondsFromGMT: 0)
        df.locale = Locale(identifier: "en-US")
        return df
    }()
    
    static let tron = TRON(baseURL: "")
    
    static var defaultHeaders: [String: String] {
        get {
            var tempHeaders: [String: String] = [
                "X-Client-Version-Name": Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String,
                "X-Client-Version-Code": Bundle.main.infoDictionary?["CFBundleVersion"] as! String,
                "X-Client-Platform-Name": "ios",
                "X-Client-Platform-Version": Bundle.main.infoDictionary?["DTPlatformVersion"] as! String,
                "X-Client-Device-Type": Bundle.main.infoDictionary?["DTPlatformName"] as! String,
                "X-Client-Timezone-Name": TimeZone.current.identifier,
                "X-Client-Timezone-Offset": String(TimeZone.current.secondsFromGMT() / 60)
            ]
            
            let s_access_token = UserDefaults.standard.value(forKey: "s_access_token")
            if (s_access_token != nil) {
                tempHeaders["Authorization"] = "Bearer \(s_access_token!)"
            }
            
            return tempHeaders
        }
    }
    
    
     // MARK: - User Request
    

    
    class func postUsersRegister(s_email: String?,
                                 s_password: String?,
                                 s_nickname: String?,
                                 i_gender: Int?,
                                 s_address: String?,
                                 i_pns_type: Int?,
                                 s_pns_token: String?,
                                 file_avatar: String?,
                                 completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
//        headers[""] = ""
        
        var params: [String: Any] = [:]
        if (s_email != nil) { params["s_email"] = s_email }
        if (s_password != nil) { params["s_password"] = s_password }
        if (s_nickname != nil) { params["s_nickname"] = s_nickname }
        params["i_gender"] =  i_gender != nil ? i_gender : ""
        params["s_address"] =  s_address != nil ? s_address : ""
        params["i_pns_type"] =  i_pns_type != nil ? i_pns_type : ""
        params["s_pns_token"] =  s_pns_token != nil ? s_pns_token : ""
        params["file_avatar"] =  file_avatar != nil ? file_avatar : ""
        params["s_udid"] = UIDevice.current.identifierForVendor?.uuidString
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/register")
        request.method = HTTPMethod.post
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            let user = objects.objects.first
            UserDefaults.standard.set(user?.s_access_token, forKey: "s_access_token")
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    
    class func postUsersLogin(s_email: String?,
                                 s_password: String?,
                                 completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        let passMd5 = s_password?.md5()
        print(passMd5)
        var params: [String: Any] = [:]
        if (s_email != nil) { params["s_email"] = s_email }
        if (s_password != nil) { params["s_password"] = passMd5 }
        
        params["s_udid"] = UIDevice.current.identifierForVendor?.uuidString
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/login")
        request.method = HTTPMethod.post
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (tronModel) in
          //  let user = tronModel.objects.first
           // UserDefaults.standard.set(user?.s_access_token, forKey: "s_access_token")
            completionHandler(tronModel, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func postUsersLogout(
                              completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        var headers = self.defaultHeaders
        
        headers["Content-Type"] = "application/x-www-form-urlencoded"
        
//        var params: [String: Any] = [:]
//        if (s_email != nil) { params["s_email"] = s_email }
//        if (s_password != nil) { params["s_password"] = s_password }
//        
//        params["s_udid"] = UIDevice.current.identifierForVendor?.uuidString
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/logout")
        request.method = HTTPMethod.post
        request.headers = headers
      //  request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func postUsersLoginProvider(i_provider_type: Int?,
                              s_provider_token: String?,
                              completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
        var params: [String: Any] = [:]
        if (i_provider_type != nil) { params["i_provider_type"] = i_provider_type }
        if (s_provider_token != nil) { params["s_provider_token"] = s_provider_token }
        
        params["s_udid"] = UIDevice.current.identifierForVendor?.uuidString
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/login_provider")
        request.method = HTTPMethod.post
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
             let user = objects.objects.first
       //      UserDefaults.standard.set(user?.s_access_token, forKey: "s_access_token")
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }

    
    
    class func postUsersDevice(i_pns_type: Int?,
                              s_pns_token: String?,
                              completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
       
        
        var params: [String: Any] = [:]
        if (i_pns_type != nil) { params["i_pns_type"] = i_pns_type }
        if (s_pns_token != nil) { params["s_pns_token"] = s_pns_token }
        
        params["s_udid"] = UIDevice.current.identifierForVendor?.uuidString
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/device")
        request.method = HTTPMethod.post
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func postUsersVerify(s_pass_code: String?,
                             
                              completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
        var params: [String: Any] = [:]
        if (s_pass_code != nil) { params["s_pass_code"] = s_pass_code }
        
        
        params["s_udid"] = UIDevice.current.identifierForVendor?.uuidString
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/verify")
        request.method = HTTPMethod.post
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    class func postUsersForgetPassword(s_email: String?,
                               
                               completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
        
        
        var params: [String: Any] = [:]
        if (s_email != nil) { params["s_email"] = s_email }
        
        
       // params["s_udid"] = UIDevice.current.identifierForVendor?.uuidString
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/forget_password")
        request.method = HTTPMethod.post
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    class func postUserschange_password(s_old_password: String?,
                                        s_new_password: String?,
                               completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
       
       
        
        var params: [String: Any] = [:]
        if (s_new_password != nil) { params["s_new_password"] = s_new_password }
        if (s_old_password != nil) { params["s_old_password"] = s_old_password }
        
       // params["s_udid"] = UIDevice.current.identifierForVendor?.uuidString
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/change_password")
        request.method = HTTPMethod.post
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    class func postUsersProfile(s_nickname: String?,
                                i_gender:Int?,
                                s_mobile_number: String?,
                                s_address: String?,
                                file_avatar: String?,
                                file_cover_photo: String?,
                                s_old_password: String?,
                                s_new_password: String?,
                               completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
       
        
        var params: [String: Any] = [:]
        params["s_nickname"] =  s_nickname != nil ? s_nickname : ""
        params["i_gender"] =  i_gender != nil ? i_gender : ""
        params["s_mobile_number"] =  s_mobile_number != nil ? s_mobile_number : ""
        params["s_address"] =  s_address != nil ? s_address : ""
        params["file_avatar"] =  file_avatar != nil ? file_avatar : ""
        params["file_cover_photo"] =  file_cover_photo != nil ? file_cover_photo : ""
        params["s_old_password"] =  s_old_password != nil ? s_old_password : ""
        params["s_new_password"] =  s_new_password != nil ? s_new_password : ""
        
        //params["s_udid"] = UIDevice.current.identifierForVendor?.uuidString
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/profile")
        request.method = HTTPMethod.post
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }

    
    class func postUsersResendPasscode(
                               
                               completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/resend_passcode")
        request.method = HTTPMethod.post
        request.headers = headers
       
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    
    class func getUserMe(completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
       
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/me")
        request.method = HTTPMethod.get
        request.headers = headers
        
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func getUsersIndex(i_id: Int?,
                             completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        //        headers[""] = ""
        
        //        var params: [String: Any] = [:]
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/index/\(i_id!)")
        request.method = HTTPMethod.get
        request.headers = headers
        //        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func getUsersList(i_page_number: Int?,
                            i_page_count: Int?,
                            s_keyword: String?,
                            completionHandler: @escaping (TronArrayManagedModel<User>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        var params: [String: Any] = [:]
        params["s_keyword"] =  s_keyword

        
        //list/:i_page_number/:i_page_count?s_keyword=
        
        let request: APIRequest<TronArrayManagedModel<User>, StatusModel> = tron.swiftyJSON.request("/users/list/\(i_page_number!)/\(i_page_count!)")
        request.method = HTTPMethod.get
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    // MARK: - Notifications Request
    
    class func getNotificationsList(i_page_number: Int?,
                            i_page_count: Int?,
                          
                            completionHandler: @escaping (TronArrayManagedModel<Notifications>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders

        
        
        //notifications/list/:i_page_number/:i_page_count
        
        let request: APIRequest<TronArrayManagedModel<Notifications>, StatusModel> = tron.swiftyJSON.request("/notifications/list/\(i_page_number!)/\(i_page_count!)")
        request.method = HTTPMethod.get
        request.headers = headers
        
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }

    // MARK: - Categories Request
    
    class func getCategoriesIndex(i_id: Int?,
                             completionHandler: @escaping (TronArrayManagedModel<Category>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        //        headers[""] = ""
        
        //       categories/list/:i_page_number/:i_page_count
        
        let request: APIRequest<TronArrayManagedModel<Category>, StatusModel> = tron.swiftyJSON.request("/categories/index/\(i_id!)")
        request.method = HTTPMethod.get
        request.headers = headers
        //        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
           
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func getCategoriesList(i_page_number: Int?,
                            i_page_count: Int?,
                            
                            completionHandler: @escaping (TronArrayManagedModel<Category>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
       
        
        
        
        
        
        let request: APIRequest<TronArrayManagedModel<Category>, StatusModel> = tron.swiftyJSON.request("categories/list/\(i_page_number!)/\(i_page_count!)")
        request.method = HTTPMethod.get
        request.headers = headers
       
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    

    // MARK: - Comment Request
    
    class func getCommentsIndex(i_comment_id: Int?,
                                  completionHandler: @escaping (TronArrayManagedModel<Comments>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        //        headers[""] = ""
        
        //       /comments/index/:i_comment_id
        
        let request: APIRequest<TronArrayManagedModel<Comments>, StatusModel> = tron.swiftyJSON.request("/comments/index/\(i_comment_id!)")
        request.method = HTTPMethod.get
        request.headers = headers
        //        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func getCommentsList(i_page_number: Int?,
                                 i_page_count: Int?,
                                 s_tag: String?,
                                 s_keyword: String?,
                                 i_user_id: Int?,
                                 i_topic_id: Int?,
                                 i_comment_id: Int?,
                                 completionHandler: @escaping (TronArrayManagedModel<Comments>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        var params: [String: Any] = [:]
        params["s_tag"] =  s_tag
        params["s_keyword"] =  s_keyword
        params["i_user_id"] =  i_user_id
        params["i_topic_id"] =  i_topic_id
        params["i_comment_id"] =  i_comment_id
       
        
        
     
        let request: APIRequest<TronArrayManagedModel<Comments>, StatusModel> = tron.swiftyJSON.request("comments/list/\(i_page_number!)/\(i_page_count!)")
        request.method = HTTPMethod.get
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }

    
    class func postCommentsIndex(i_topic_id: Int?,
                                 s_details: String?,
                                  completionHandler: @escaping (TronArrayManagedModel<Comments>?, APIError<StatusModel>?) -> Swift.Void) {
        
        var headers = self.defaultHeaders
        
        headers["Content-Type"] = "application/x-www-form-urlencoded"

        
        var params: [String: Any] = [:]
        if (i_topic_id != nil) { params["i_topic_id"] = i_topic_id }
        if (s_details != nil) { params["s_details"] = s_details }
        
        
        let request: APIRequest<TronArrayManagedModel<Comments>, StatusModel> = tron.swiftyJSON.request("/comments/index/")
        request.method = HTTPMethod.post
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func putCommentsIndex(i_id: Int?,
                                s_details: String?,
                                file_image: String?,
                                i_comment_id: Int?,
                                completionHandler: @escaping (TronArrayManagedModel<Comments>?, APIError<StatusModel>?) -> Swift.Void) {
        
        var headers = self.defaultHeaders
        
        headers["Content-Type"] = "application/x-www-form-urlencoded"

        
        var params: [String: Any] = [:]
        if (i_id != nil) { params["i_id"] = i_id }
        if (s_details != nil) { params["s_details"] = s_details }
        params["file_image"] = file_image
        
        let request: APIRequest<TronArrayManagedModel<Comments>, StatusModel> = tron.swiftyJSON.request("/comments/index/\(i_comment_id!)")
        request.method = HTTPMethod.put
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func delCommentsIndex(i_comment_id: Int?,
                                completionHandler: @escaping (TronArrayManagedModel<Comments>?, APIError<StatusModel>?) -> Swift.Void) {
        
        var headers = self.defaultHeaders
        
        headers["Content-Type"] = "application/x-www-form-urlencoded"
        
      
        
        let request: APIRequest<TronArrayManagedModel<Comments>, StatusModel> = tron.swiftyJSON.request("/comments/index/\(i_comment_id!)")
        request.method = HTTPMethod.delete
       // let contentType = request.allHeaderFields["Content-Type"] as? String
        request.headers = headers
       
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func postCommentsReport(i_id: Int?,
                                i_type: Int?,
                                s_other: String?,
                             
                                completionHandler: @escaping (TronArrayManagedModel<Comments>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
        
        
        
        var params: [String: Any] = [:]
        if (i_id != nil) { params["i_id"] = i_id }
        if (i_type != nil) { params["i_type"] = i_type}
        if (s_other != nil) { params["s_other"] = s_other}
        
        let request: APIRequest<TronArrayManagedModel<Comments>, StatusModel> = tron.swiftyJSON.request("/comments/report")
        request.method = HTTPMethod.post
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }

    // MARK: - Item Request
    class func getItemIndex(i_item_id: Int?,
                                completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        //        headers[""] = ""
        
        //       /comments/index/:i_comment_id
        
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("/items/index/\(i_item_id!)")
        request.method = HTTPMethod.get
        request.headers = headers
        //        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func getItemList(i_page_number: Int?,
                               i_page_count: Int?,
                               s_tag: String?,
                               s_keyword: String?,
                               i_user_id: Int?,
                               i_category_id: Int?,
                               b_favorite: Bool?,
                               b_like: Bool?,
                               b_spam: Bool?,
                               completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
      
        
        let headers = self.defaultHeaders
        var params: [String: Any] = [:]
        params["s_tag"] =  s_tag
        params["s_keyword"] =  s_keyword
        params["i_user_id"] =  i_user_id
        params["i_category_id"] =  i_category_id
        params["b_favorite"] =  b_favorite
        params["b_like"] =  b_like
        params["b_spam"] =  b_spam
        
        
        
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("items/list/\(i_page_number!)/\(i_page_count!)")
        request.method = HTTPMethod.get
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }

    class func getItemLike(i_page_number: Int?,
                           i_page_count: Int?,
                        
                           completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
        
        
        let headers = self.defaultHeaders
       
        
        
        
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("items/like/\(i_page_number!)/\(i_page_count!)")
        request.method = HTTPMethod.get
        request.headers = headers
       
        
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    class func getItemFavorite(i_page_number: Int?,
                           i_page_count: Int?,
                        
                           completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
        
        
        let headers = self.defaultHeaders
    
        
        
        
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("items/favorite/\(i_page_number!)/\(i_page_count!)")
        request.method = HTTPMethod.get
        request.headers = headers
      
        request.perform(withSuccess: { (objects) in
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func delItemIndex(i_item_id: Int?,
                                completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
        
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("/items/index/\(i_item_id!)")
        request.method = HTTPMethod.delete
        // let contentType = request.allHeaderFields["Content-Type"] as? String
        request.headers = headers
        
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func delItemFavorite(i_item_id: Int?,
                            completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
        
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("/items/favorite/\(i_item_id!)")
        request.method = HTTPMethod.delete
        // let contentType = request.allHeaderFields["Content-Type"] as? String
        request.headers = headers
        
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func delItemLike(i_item_id: Int?,
                            completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
        
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("/items/like/\(i_item_id!)")
        request.method = HTTPMethod.delete
        // let contentType = request.allHeaderFields["Content-Type"] as? String
        request.headers = headers
        
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func postItemFavorite(i_item_id: Int?,
                               completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
        
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("/items/favorite/\(i_item_id!)")
        request.method = HTTPMethod.post
        // let contentType = request.allHeaderFields["Content-Type"] as? String
        request.headers = headers
        
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func postItemLike(i_item_id: Int?,
                           completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
        
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("/items/like/\(i_item_id!)")
        request.method = HTTPMethod.post
        // let contentType = request.allHeaderFields["Content-Type"] as? String
        request.headers = headers
        
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
    class func putItemIndex(i_item_id: Int?,
                            i_id: Int?,
                            i_category_id: Int?,
                            s_title: String?,
                            s_details: String?,
                            s_delete_images_ids: String?,
                            completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        var params: [String: Any] = [:]
        if (i_id != nil) { params["i_id"] = i_id }
        if (i_category_id != nil) { params["i_category_id"] = i_category_id}
        if (s_title != nil) { params["s_title"] = s_title}
        
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("/items/index/\(i_item_id!)?_method=PUT")
        request.method = HTTPMethod.post
    
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    class func postItemIndex(
                            i_category_id: Int?,
                            s_title: String?,
                            s_details: String?,
                            
                            completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        var params: [String: Any] = [:]
        
        if (i_category_id != nil) { params["i_category_id"] = i_category_id}
        if (s_title != nil) { params["s_title"] = s_title}
        if (s_details != nil) { params["s_details"] = s_details}
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("/items/index/")
        request.method = HTTPMethod.post
        
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    class func postItemsReport(i_item_id: Int?,
                               i_id: Int?,
                               i_type: Int?,
                               s_other: String?,
                               completionHandler: @escaping (TronArrayManagedModel<Item>?, APIError<StatusModel>?) -> Swift.Void) {
        
        let headers = self.defaultHeaders
        
        
        
        
        var params: [String: Any] = [:]
        if (i_id != nil) { params["i_id"] = i_id }
        if (i_type != nil) { params["i_type"] = i_type}
        if (s_other != nil) { params["s_other"] = s_other}
        
        let request: APIRequest<TronArrayManagedModel<Item>, StatusModel> = tron.swiftyJSON.request("/items/report/\(i_item_id!)")
        request.method = HTTPMethod.post
        request.headers = headers
        request.parameters = params
        
        request.perform(withSuccess: { (objects) in
            
            completionHandler(objects, nil)
        }) { (error) in
            completionHandler(nil, error)
        }
    }
    
}
