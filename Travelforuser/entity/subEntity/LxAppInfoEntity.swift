//
//  LxAppInfoEntity.swift
//  travelforuser
//
//  Created by 倫星 on 2014/06/24.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

class LxAppInfoEntity: LxbaseEntity {
    
    var name:String = ""
    
    var version:String = ""
    
    init() {
        super.init()
    }
    
    override func setEntity(mobj:NSManagedObject) -> Bool {
        var result:Bool = super.setEntity(mobj)
        if false == result {
            return false
        }
        
        self.name = mobj.valueForKey("name") as String
        self.version = mobj.valueForKey("version") as String

        return true
    }
    
    override func getModel(inManagedObjectContext context: NSManagedObjectContext!) -> NSManagedObject{
        var entity:NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("AppInfoEntity", inManagedObjectContext:context) as NSManagedObject

        entity.setValue(self.name, forKey:"name")
        entity.setValue(self.version, forKey:"version")
        
        return entity
    }
    
    override func initFormMap(map:NSDictionary!) {
        self.isEmpty = false
        self.name = map.objectForKey("name") as String
        self.version = map.objectForKey("version") as String
    }
    
    override func copyEntity(baseEntity:LxbaseEntity) {
        super.copyEntity(baseEntity)
        
        var entity:LxAppInfoEntity = baseEntity as LxAppInfoEntity
        self.name = entity.name
        self.version = entity.version
    }
    
    override func toString() -> String {
        var str = super.toString()
        str += "name:" + self.name + "\n"
        str += "version:" + self.version
        
        return str
    }
}