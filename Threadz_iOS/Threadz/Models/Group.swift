//
//  Group.swift
//  Threadz
//
//  Created by Hammad Mushtaq on 2/10/16.
//  Copyright © 2016 Hammad Mushtaq. All rights reserved.
//

import RealmSwift

class Group: Object {
    dynamic var id : Int = 0
    dynamic var latestMessage : Message?
    dynamic var name : String?
    dynamic var groupPicUrl : String?
    let members = List<User>()
}
