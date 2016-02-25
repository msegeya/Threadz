//
//  TSessionManager.swift
//  Threadz
//
//  Created by Hammad Mushtaq on 2/10/16.
//  Copyright © 2016 Hammad Mushtaq. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire

class TSessionManager: NSObject {

    static let sharedManager = TSessionManager()
    
    // Store the current user's id temporarily here
    // TODO: Store the id in the keychain
    static var currentUserId : Int?
    
    // Get the current user object or nil if there is no user currently logged in
    static var currentUser : User? {
        get {
            if let userId = self.currentUserId {
                return try? Realm().objects(User).filter("id == %@", userId).first!
            }
            else {
                return nil
            }
        }
    }
    
    func logInWithPhoneNumber(phoneNumber: String, password: String, callback:(User?) -> Void) {
        let parameters = [
            TNetworkRequestParameterKeyPhoneNumber: phoneNumber,
            TNetworkRequestParameterKeyPassword: password
        ]
        Alamofire.request(
            .GET,
            TNetworkRequestUserBaseUrl,
            parameters: parameters,
            encoding: .URL,
            headers: nil
        )
        .responseJSON { (loginResponse) -> Void in
            if let userArray = loginResponse.result.value as! [AnyObject]? {
                print(userArray.description)
                if(!userArray.isEmpty) {
                    let user = User(value: userArray.first!)
                    
                    // Save the user Id of the current logged in user
                    TSessionManager.currentUserId = user.id
                    
                    // Save the user to the database
                    let realm = try! Realm()
                    try! realm.write({ () -> Void in
                        realm.add(user)
                        callback(user)
                    })
                }
                else {
                    print("There is no user with those credentials...creating new user")
                    Alamofire.request(
                        .POST,
                        TNetworkRequestUserBaseUrl,
                        parameters: parameters,
                        encoding: .JSON,
                        headers: nil
                        )
                        .responseJSON(completionHandler: { (creationResponse) -> Void in
                            if let responseDictionary = creationResponse.result.value as! Dictionary<String, AnyObject>? {
                                print(responseDictionary.description)
                                let user = User(value: responseDictionary)
                                
                                TSessionManager.currentUserId = user.id
                                
                                let realm = try! Realm()
                                
                                try! realm.write({ () -> Void in
                                    realm.add(user)
                                    callback(user)
                                })
                            }
                            else {
                                print("User creation failed")
                                callback(nil)
                            }
                        })
                }
            }
            else {
                print("User creation failed!")
                callback(nil)
            }
        }
    }
    
}
