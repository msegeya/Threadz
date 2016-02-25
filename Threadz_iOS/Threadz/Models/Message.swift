//
//  Message.swift
//  Threadz
//
//  Created by Hammad Mushtaq on 2/10/16.
//  Copyright © 2016 Hammad Mushtaq. All rights reserved.
//

import RealmSwift

class Message: Object {
    dynamic var id : Int = 0
    dynamic var type : Int = 0
    dynamic var content : String?
}
