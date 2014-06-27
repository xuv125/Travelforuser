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
    
    override func setEntity(mobj:NSManagedObject) -> Bool {
        var result:Bool = super.setEntity(mobj)
        if false == result {
            return false;
        }
        
        self.name = mobj.valueForKey("name") as String
        self.version = mobj.valueForKey("version") as String

        return true;
    }
    
    override func getModel(inManagedObjectContext context: NSManagedObjectContext!) -> NSManagedObject{
        var entity:NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("AppInfoEntity", inManagedObjectContext:context) as NSManagedObject

        entity.setValue(self.name, forKey:"name")
        entity.setValue(self.version, forKey:"version")
        
        return entity;
    }
    
    override func copyEntity(lxbaseEntity:LxbaseEntity) {
        super.copyEntity(lxbaseEntity)
        
        var lxAppInfoEntity:LxAppInfoEntity = lxbaseEntity as LxAppInfoEntity
        self.name = lxAppInfoEntity.name
        self.version = lxAppInfoEntity.version
    }
}