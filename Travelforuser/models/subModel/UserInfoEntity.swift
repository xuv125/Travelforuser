//
//  LxUserInfoEntity.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/06/24.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

class UserInfoEntity: BaseEntity {
    @NSManaged var account_id:String
    @NSManaged var create_time:String
    @NSManaged var email:String
    @NSManaged var golden_coin:Int
    @NSManaged var last_login_time:String
    @NSManaged var login_count:Int
    @NSManaged var login_time:String
    @NSManaged var name_en:String
    @NSManaged var name_kanji:String
    @NSManaged var name_katakana:String
    @NSManaged var password:String
    @NSManaged var shop_id:String
    @NSManaged var silver_coin:Int
    @NSManaged var status:Int
    @NSManaged var tel:String
    @NSManaged var update_time:String
    @NSManaged var user_id:String
}
