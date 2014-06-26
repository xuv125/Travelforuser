//
//  LxAppInfoEntity.swift
//  travelforuser
//
//  Created by 倫星 on 2014/06/24.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

class LxAppInfoEntity: LxbaseEntity {
    
    var name:String = "";
    var version:String = "";
    
    init() {
        super.init()
    }
    
    override func setEntity(baseEntity:BaseEntity) -> Bool {
        var result:Bool = super.setEntity(baseEntity)
        if false == result {
            return false;
        }

        var mobj = baseEntity as AppInfoEntity
        
        self.name = mobj.valueForKey("name") as String
        self.version = mobj.valueForKey("version") as String

        return true;
    }
    
    override func getModel(inManagedObjectContext context: NSManagedObjectContext!) -> AppInfoEntity{
        var entity = NSEntityDescription.insertNewObjectForEntityForName("AppInfoEntity", inManagedObjectContext:context) as AppInfoEntity

//        entity.setValue(self.name, forKey:"name")
//        entity.setValue(self.version, forKey:"version")
        entity.name = self.name
        entity.version = self.version
        
        return entity;
    }
    
    override func copyEntity(lxbaseEntity:LxbaseEntity) {
        super.copyEntity(lxbaseEntity)
        
        var lxAppInfoEntity:LxAppInfoEntity = lxbaseEntity as LxAppInfoEntity
        self.name = lxAppInfoEntity.name
        self.version = lxAppInfoEntity.version
    }
}