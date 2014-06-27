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
    var golden_coin_id:String = ""
    var golden_coin:Int = 0
    var last_login_time:String = ""
    var login_count:Int = 0
    var login_time:String = ""
    var name_en_family:String = ""
    var name_en_middle:String = ""
    var name_en_last:String = ""
    var name_kanji_sei:String = ""
    var name_kanji_mei:String = ""
    var name_katakana_sei:String = ""
    var name_katakana_mei:String = ""
    var password:String = ""
    var shop_id:String = ""
    var silver_coin_id:String = ""
    var silver_coin:Int = 0
    var status:Int = 0
    var tel:String = ""
    var update_time:String = ""
    var user_id:String = ""
    
    init() {
        super.init()
    }
    
    override func setEntity(mobj:NSManagedObject) -> Bool{
        var result:Bool = super.setEntity(mobj)
        if false == result {
            return false;
        }
        
        self.account_id = mobj.valueForKey("account_id") as String
        self.create_time = mobj.valueForKey("create_time") as String
        self.email = mobj.valueForKey("email") as String
        self.golden_coin_id = mobj.valueForKey("golden_coin_id") as String
        self.golden_coin = mobj.valueForKey("golden_coin") as Int
        self.last_login_time = mobj.valueForKey("last_login_time") as String
        self.login_count = mobj.valueForKey("login_count") as Int
        self.login_time = mobj.valueForKey("login_time") as String
        self.name_en_family = mobj.valueForKey("name_en_family") as String
        self.name_en_middle = mobj.valueForKey("name_en_middle") as String
        self.name_en_last = mobj.valueForKey("name_en_last") as String
        self.name_kanji_sei = mobj.valueForKey("name_kanji_sei") as String
        self.name_kanji_mei = mobj.valueForKey("name_kanji_mei") as String
        self.name_katakana_sei = mobj.valueForKey("name_katakana_sei") as String
        self.name_katakana_mei = mobj.valueForKey("name_katakana_mei") as String
        self.password = mobj.valueForKey("password") as String
        self.shop_id = mobj.valueForKey("shop_id") as String
        self.silver_coin_id = mobj.valueForKey("silver_coin_id") as String
        self.silver_coin = mobj.valueForKey("silver_coin") as Int
        self.status = mobj.valueForKey("status") as Int
        self.tel = mobj.valueForKey("tel") as String
        self.update_time = mobj.valueForKey("update_time") as String
        self.user_id = mobj.valueForKey("user_id") as String
        
        return true;
    }
    
    override func getModel(inManagedObjectContext context: NSManagedObjectContext!) -> NSManagedObject{
        var entity:NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("UserInfoEntity", inManagedObjectContext:context) as NSManagedObject

        entity.setValue(self.account_id, forKey:"account_id")
        entity.setValue(self.create_time, forKey:"create_time")
        entity.setValue(self.email, forKey:"email")
        entity.setValue(self.golden_coin_id, forKey:"golden_coin_id")
        entity.setValue(self.golden_coin, forKey:"golden_coin")
        entity.setValue(self.last_login_time, forKey:"last_login_time")
        entity.setValue(self.login_count, forKey:"login_count")
        entity.setValue(self.login_time, forKey:"login_time")
        entity.setValue(self.name_en_family, forKey:"name_en_family")
        entity.setValue(self.name_en_middle, forKey:"name_en_middle")
        entity.setValue(self.name_en_last, forKey:"name_en_last")
        entity.setValue(self.name_kanji_sei, forKey:"name_kanji_sei")
        entity.setValue(self.name_kanji_mei, forKey:"name_kanji_mei")
        entity.setValue(self.name_katakana_sei, forKey:"name_katakana_sei")
        entity.setValue(self.name_katakana_mei, forKey:"name_katakana_mei")
        entity.setValue(self.password, forKey:"password")
        entity.setValue(self.shop_id, forKey:"shop_id")
        entity.setValue(self.silver_coin_id, forKey:"silver_coin_id")
        entity.setValue(self.silver_coin, forKey:"silver_coin")
        entity.setValue(self.status, forKey:"status")
        entity.setValue(self.tel, forKey:"tel")
        entity.setValue(self.update_time, forKey:"update_time")
        entity.setValue(self.user_id, forKey:"user_id")

        return entity;
    }
    
    override func copyEntity(lxbaseEntity:LxbaseEntity) {
        super.copyEntity(lxbaseEntity)
        var lxUserInfoEntity:LxUserInfoEntity = lxbaseEntity as LxUserInfoEntity
        
        self.account_id = lxUserInfoEntity.account_id
        self.create_time = lxUserInfoEntity.create_time
        self.email = lxUserInfoEntity.email
        self.golden_coin_id = lxUserInfoEntity.golden_coin_id
        self.golden_coin = lxUserInfoEntity.golden_coin
        self.last_login_time = lxUserInfoEntity.last_login_time
        self.login_count = lxUserInfoEntity.login_count
        self.login_time = lxUserInfoEntity.login_time
        self.name_en_family = lxUserInfoEntity.name_en_family
        self.name_en_middle = lxUserInfoEntity.name_en_middle
        self.name_en_last = lxUserInfoEntity.name_en_last
        self.name_kanji_sei = lxUserInfoEntity.name_kanji_sei
        self.name_kanji_mei = lxUserInfoEntity.name_kanji_mei
        self.name_katakana_sei = lxUserInfoEntity.name_katakana_sei
        self.name_katakana_mei = lxUserInfoEntity.name_katakana_mei
        self.password = lxUserInfoEntity.password
        self.shop_id = lxUserInfoEntity.shop_id
        self.silver_coin_id = lxUserInfoEntity.silver_coin_id
        self.silver_coin = lxUserInfoEntity.silver_coin
        self.status = lxUserInfoEntity.status
        self.tel = lxUserInfoEntity.tel
        self.update_time = lxUserInfoEntity.update_time
        self.user_id = lxUserInfoEntity.user_id
    }
}
