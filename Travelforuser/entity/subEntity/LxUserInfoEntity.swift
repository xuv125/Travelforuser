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
            return false
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
        
        return true
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

        return entity
    }
    
    override func initFormMap(map:NSDictionary!) {
        self.isEmpty = false
        self.account_id = map.objectForKey("account_id") as String
        self.create_time = map.objectForKey("create_time") as String
        self.email = map.objectForKey("email") as String
        self.golden_coin_id = map.objectForKey("golden_coin_id") as String
        self.golden_coin = map.objectForKey("golden_coin") as Int
        self.last_login_time = map.objectForKey("last_login_time") as String
        self.login_count = map.objectForKey("login_count") as Int
        self.login_time = map.objectForKey("login_time") as String
        self.name_en_family = map.objectForKey("name_en_family") as String
        self.name_en_middle = map.objectForKey("name_en_middle") as String
        self.name_en_last = map.objectForKey("name_en_last") as String
        self.name_kanji_sei = map.objectForKey("name_kanji_sei") as String
        self.name_kanji_mei = map.objectForKey("name_kanji_mei") as String
        self.name_katakana_sei = map.objectForKey("name_katakana_sei") as String
        self.name_katakana_mei = map.objectForKey("name_katakana_mei") as String
        self.password = map.objectForKey("password") as String
        self.shop_id = map.objectForKey("shop_id") as String
        self.silver_coin_id = map.objectForKey("silver_coin_id") as String
        self.silver_coin = map.objectForKey("silver_coin") as Int
        self.status = map.objectForKey("status") as Int
        self.tel = map.objectForKey("tel") as String
        self.update_time = map.objectForKey("update_time") as String
        self.user_id = map.objectForKey("user_id") as String
    }
    
    override func copyEntity(baseEntity:LxbaseEntity) {
        super.copyEntity(baseEntity)
        var entity:LxUserInfoEntity = baseEntity as LxUserInfoEntity
        
        self.account_id = entity.account_id
        self.create_time = entity.create_time
        self.email = entity.email
        self.golden_coin_id = entity.golden_coin_id
        self.golden_coin = entity.golden_coin
        self.last_login_time = entity.last_login_time
        self.login_count = entity.login_count
        self.login_time = entity.login_time
        self.name_en_family = entity.name_en_family
        self.name_en_middle = entity.name_en_middle
        self.name_en_last = entity.name_en_last
        self.name_kanji_sei = entity.name_kanji_sei
        self.name_kanji_mei = entity.name_kanji_mei
        self.name_katakana_sei = entity.name_katakana_sei
        self.name_katakana_mei = entity.name_katakana_mei
        self.password = entity.password
        self.shop_id = entity.shop_id
        self.silver_coin_id = entity.silver_coin_id
        self.silver_coin = entity.silver_coin
        self.status = entity.status
        self.tel = entity.tel
        self.update_time = entity.update_time
        self.user_id = entity.user_id
    }
    
    override func toString() -> String {
        var str = super.toString()
        str += "account_id:" + self.account_id + "\n"
        str += "create_time:" + self.create_time + "\n"
        str += "email:" + self.email + "\n"
        str += "golden_coin_id:" + self.golden_coin_id + "\n"
        str += "golden_coin:\(self.golden_coin)" + "\n"
        str += "last_login_time:" + self.last_login_time + "\n"
        str += "login_count:\(self.login_count)" + "\n"
        str += "login_time:" + self.login_time + "\n"
        str += "name_en_family:" + self.name_en_family + "\n"
        str += "name_en_middle:" + self.name_en_middle + "\n"
        str += "name_en_last:" + self.name_en_last + "\n"
        str += "name_kanji_sei:" + self.name_kanji_sei + "\n"
        str += "name_kanji_mei:" + self.name_kanji_mei + "\n"
        str += "name_katakana_sei:" + self.name_katakana_sei + "\n"
        str += "name_katakana_mei:" + self.name_katakana_mei + "\n"
        str += "password:" + self.password + "\n"
        str += "shop_id:" + self.shop_id + "\n"
        str += "silver_coin_id:" + self.silver_coin_id + "\n"
        str += "silver_coin:\(self.silver_coin)" + "\n"
        str += "status:\(self.status)" + "\n"
        str += "tel:" + self.tel + "\n"
        str += "update_time:" + self.update_time + "\n"
        str += "user_id:" + self.user_id

        return str
    }
}
