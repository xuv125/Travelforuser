//
//  LxAreaInfoEntity.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/11.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

class LxAreaInfoEntity: LxbaseEntity {
    
    var area_id:String = ""
    
    var coordinate_x:String = ""
    
    var coordinate_y:String = ""
    
    var parent_id:String = ""
    
    var level:Int = 0
    
    var language_id:String = ""
    
    var name:String = ""
    
    var descriptionx:String = ""
    
    var area_img:String = ""
    
    init() {
        super.init()
    }
    
    override func setEntity(mobj:NSManagedObject) -> Bool {
        var result:Bool = super.setEntity(mobj)
        if false == result {
            return false
        }
        
        self.area_id = mobj.valueForKey("area_id") as String
        self.coordinate_x = mobj.valueForKey("coordinate_x") as String
        self.coordinate_y = mobj.valueForKey("coordinate_y") as String
        self.parent_id = mobj.valueForKey("parent_id") as String
        self.level = mobj.valueForKey("level") as Int
        self.language_id = mobj.valueForKey("language_id") as String
        self.name = mobj.valueForKey("name") as String
        self.descriptionx = mobj.valueForKey("descriptionx") as String
        self.area_img = mobj.valueForKey("area_img") as String
        
        return true
    }
    
    override func getModel(inManagedObjectContext context: NSManagedObjectContext!) -> NSManagedObject{
        var entity:NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("AppInfoEntity", inManagedObjectContext:context) as NSManagedObject
        
        entity.setValue(self.area_id, forKey:"area_id")
        entity.setValue(self.coordinate_x, forKey:"coordinate_x")
        entity.setValue(self.coordinate_y, forKey:"coordinate_y")
        entity.setValue(self.parent_id, forKey:"parent_id")
        entity.setValue(self.level, forKey:"level")
        entity.setValue(self.language_id, forKey:"language_id")
        entity.setValue(self.name, forKey:"name")
        entity.setValue(self.descriptionx, forKey:"descriptionx")
        entity.setValue(self.area_img, forKey:"area_img")
        
        return entity
    }
    
    override func initFormMap(map:NSDictionary!) {
        self.isEmpty = false
        self.area_id = map.objectForKey("area_id") as String
        self.coordinate_x = map.objectForKey("coordinate_x") as String
        self.coordinate_y = map.objectForKey("coordinate_y") as String
        self.parent_id = map.objectForKey("parent_id") as String
        self.level = map.objectForKey("level") as Int
        self.language_id = map.objectForKey("language_id") as String
        self.name = map.objectForKey("name") as String
        self.descriptionx = map.objectForKey("descriptionx") as String
        self.area_img = map.objectForKey("area_img") as String
    }
    
    override func copyEntity(baseEntity:LxbaseEntity) {
        super.copyEntity(baseEntity)
        
        var entity:LxAreaInfoEntity = baseEntity as LxAreaInfoEntity
        self.area_id = entity.area_id
        self.coordinate_x = entity.coordinate_x
        self.coordinate_y = entity.coordinate_y
        self.parent_id = entity.parent_id
        self.level = entity.level
        self.language_id = entity.language_id
        self.name = entity.name
        self.descriptionx = entity.descriptionx
        self.area_img = entity.area_img
    }
    
    override func toString() -> String {
        var str = super.toString()
        str += "area_id:" + self.area_id + "\n"
        str += "coordinate_x:" + self.coordinate_x + "\n"
        str += "coordinate_y:" + self.coordinate_y + "\n"
        str += "parent_id:" + self.parent_id + "\n"
        str += "level:\(self.level)" + "\n"
        str += "language_id:" + self.language_id + "\n"
        str += "name:" + self.name + "\n"
        str += "descriptionx:" + self.descriptionx + "\n"
        str += "area_img:" + self.area_img
        
        return str
    }
}
