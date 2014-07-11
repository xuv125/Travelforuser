//
//  LxGoodsEntity.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/07.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

class LxGoodsInfoEntity: LxbaseEntity {
    
    var goods_id:String = ""
    
    var goodstype_id:String = ""
    
    var area_id:String = ""
    
    var status:Int = 0
    
    var click_count:Int = 0
    
    var is_hot:Bool = false
    
    var is_new:Bool = false
    
    var language_id:String = ""
    
    var name:String = ""
    
    var descriptionx:String = ""
    
    var price:Float = 0.0
    
    var currency_unit:String = ""
    
    var goods_img:String = ""
    
    init() {
        super.init()
    }
    
    override func setEntity(mobj:NSManagedObject) -> Bool {
        var result:Bool = super.setEntity(mobj)
        if false == result {
            return false
        }
        
        self.goods_id = mobj.valueForKey("goods_id") as String
        self.goodstype_id = mobj.valueForKey("goodstype_id") as String
        self.area_id = mobj.valueForKey("area_id") as String
        self.status = mobj.valueForKey("status") as Int
        self.click_count = mobj.valueForKey("click_count") as Int
        self.is_hot = mobj.valueForKey("is_hot") as Bool
        self.is_new = mobj.valueForKey("is_new") as Bool
        self.language_id = mobj.valueForKey("language_id") as String
        self.name = mobj.valueForKey("name") as String
        self.descriptionx = mobj.valueForKey("descriptionx") as String
        self.price = mobj.valueForKey("price") as Float
        self.currency_unit = mobj.valueForKey("currency_unit") as String
        self.goods_img = mobj.valueForKey("goods_img") as String
        
        return true
    }
    
    override func getModel(inManagedObjectContext context: NSManagedObjectContext!) -> NSManagedObject{
        var entity:NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("GoodsInfoEntity", inManagedObjectContext:context) as NSManagedObject
        
        entity.setValue(self.goods_id, forKey:"goods_id")
        entity.setValue(self.goodstype_id, forKey:"goodstype_id")
        entity.setValue(self.area_id, forKey:"area_id")
        entity.setValue(self.status, forKey:"status")
        entity.setValue(self.click_count, forKey:"click_count")
        entity.setValue(self.is_hot, forKey:"is_hot")
        entity.setValue(self.is_new, forKey:"is_new")
        entity.setValue(self.language_id, forKey:"language_id")
        entity.setValue(self.name, forKey:"name")
        entity.setValue(self.descriptionx, forKey:"descriptionx")
        entity.setValue(self.price, forKey:"price")
        entity.setValue(self.currency_unit, forKey:"currency_unit")
        entity.setValue(self.goods_img, forKey:"goods_img")
        
        return entity
    }
    
    override func initFormMap(map:NSDictionary!) {
        self.isEmpty = false
        self.goods_id = map.objectForKey("goods_id") as String
        self.goodstype_id = map.objectForKey("goodstype_id") as String
        self.area_id = map.objectForKey("area_id") as String
        self.status = map.objectForKey("status") as Int
        self.click_count = map.objectForKey("click_count") as Int
        self.is_hot = map.objectForKey("is_hot") as Bool
        self.is_new = map.objectForKey("is_new") as Bool
        self.language_id = map.objectForKey("language_id") as String
        self.name = map.objectForKey("name") as String
        self.descriptionx = map.objectForKey("descriptionx") as String
        self.price = map.objectForKey("price") as Float
        self.currency_unit = map.objectForKey("currency_unit") as String
        self.goods_img = map.objectForKey("goods_img") as String
    }
    
    override func copyEntity(baseEntity:LxbaseEntity) {
        super.copyEntity(baseEntity)
        
        var entity:LxGoodsInfoEntity = baseEntity as LxGoodsInfoEntity
        self.goods_id = entity.goods_id
        self.goodstype_id = entity.goodstype_id
        self.area_id = entity.area_id
        self.status = entity.status
        self.click_count = entity.click_count
        self.is_hot = entity.is_hot
        self.is_new = entity.is_new
        self.language_id = entity.language_id
        self.name = entity.name
        self.descriptionx = entity.descriptionx
        self.price = entity.price
        self.currency_unit = entity.currency_unit
        self.goods_img = entity.goods_img
    }
    
    override func toString() -> String {
        var str = super.toString()
        str += "goods_id:" + self.goods_id + "\n"
        str += "goodstype_id:" + self.goodstype_id + "\n"
        str += "area_id:" + self.area_id + "\n"
        str += "status:\(self.status)" + "\n"
        str += "click_count:\(self.click_count)" + "\n"
        str += "is_hot:\(self.is_hot)" + "\n"
        str += "is_new:\(self.is_new)" + "\n"
        str += "language_id:" + self.language_id + "\n"
        str += "name:" + self.name + "\n"
        str += "descriptionx:" + self.descriptionx + "\n"
        str += "goods_id:" + self.goods_id + "\n"
        str += "price:\(self.price)" + "\n"
        str += "currency_unit:" + self.currency_unit + "\n"
        str += "goods_img:" + self.goods_img
        
        return str
    }
}
