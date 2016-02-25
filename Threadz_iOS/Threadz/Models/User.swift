//
//  User.swift
//  Threadz
//
//  Created by Hammad Mushtaq on 2/10/16.
//  Copyright © 2016 Hammad Mushtaq. All rights reserved.
//

import RealmSwift

class User: Object {
    dynamic var id : Int = 0
    dynamic var firstName : String?
    dynamic var lastName : String?
    dynamic var phoneNumber : String?
    dynamic var profilePicUrl : String?
    
    var groups : [Group] {
        return linkingObjects(Group.self, forProperty: "members")
    }
}
