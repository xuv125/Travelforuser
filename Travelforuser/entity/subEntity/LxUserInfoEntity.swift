//
//  LxUserInfoEntity.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/06/24.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

class LxUserInfoEntity: LxbaseEntity {
    
    var account_id:String = ""
    var create_time:String = ""
    var email:String = ""
    var golden_coin:Int = 0
    var last_login_time:String = ""
    var login_count:Int = 0
    var login_time:String = ""
    var name_en:String = ""
    var name_kanji:String = ""
    var name_katakana:String = ""
    var password:String = ""
    var shop_id:String = ""
    var silver_coin:Int = 0
    var status:Int = 0
    var tel:String = ""
    var update_time:String = ""
    var user_id:String = ""
    
    init() {
        super.init()
    }
    
    override func setEntity(baseEntity:BaseEntity) -> Bool{
        var result:Bool = super.setEntity(baseEntity)
        if false == result {
            return false;
        }
        
        var mobj = baseEntity as UserInfoEntity
        
        self.account_id = mobj.valueForKey("name") as String
        self.create_time = mobj.valueForKey("name") as String
        self.email = mobj.valueForKey("name") as String
        self.golden_coin = mobj.valueForKey("name") as Int
        self.last_login_time = mobj.valueForKey("name") as String
        self.login_count = mobj.valueForKey("name") as Int
        self.login_time = mobj.valueForKey("name") as String
        self.name_en = mobj.valueForKey("name") as String
        self.name_kanji = mobj.valueForKey("name") as String
        self.name_katakana = mobj.valueForKey("name") as String
        self.password = mobj.valueForKey("name") as String
        self.shop_id = mobj.valueForKey("name") as String
        self.silver_coin = mobj.valueForKey("name") as Int
        self.status = mobj.valueForKey("name") as Int
        self.tel = mobj.valueForKey("name") as String
        self.update_time = mobj.valueForKey("name") as String
        self.user_id = mobj.valueForKey("name") as String
        
        return true;
    }
    
    override func getModel(inManagedObjectContext context: NSManagedObjectContext!) -> UserInfoEntity{
        var entity:UserInfoEntity = NSEntityDescription.insertNewObjectForEntityForName("UserInfoEntity", inManagedObjectContext:context) as UserInfoEntity
        

        return entity;
    }
    
    override func copyEntity(lxbaseEntity:LxbaseEntity) {
        super.copyEntity(lxbaseEntity)
        var lxUserInfoEntity:LxUserInfoEntity = lxbaseEntity as LxUserInfoEntity
        
        self.account_id = lxUserInfoEntity.account_id
        self.create_time = lxUserInfoEntity.create_time
        self.email = lxUserInfoEntity.email
        self.golden_coin = lxUserInfoEntity.golden_coin
        self.last_login_time = lxUserInfoEntity.last_login_time
        self.login_count = lxUserInfoEntity.login_count
        self.login_time = lxUserInfoEntity.login_time
        self.name_en = lxUserInfoEntity.name_en
        self.name_kanji = lxUserInfoEntity.name_kanji
        self.name_katakana = lxUserInfoEntity.name_katakana
        self.password = lxUserInfoEntity.password
        self.shop_id = lxUserInfoEntity.shop_id
        self.silver_coin = lxUserInfoEntity.silver_coin
        self.status = lxUserInfoEntity.status
        self.tel = lxUserInfoEntity.tel
        self.update_time = lxUserInfoEntity.update_time
        self.user_id = lxUserInfoEntity.user_id
    }
}
