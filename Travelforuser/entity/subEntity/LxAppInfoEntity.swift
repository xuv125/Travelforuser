//
//  LxAppInfoEntity.swift
//  travelforuser
//
//  Created by 倫星 on 2014/06/24.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

class LxAppInfoEntity: LxbaseEntity {
    
    @NSManaged var name:String;
    @NSManaged var version:String;
    
    init() {
        super.init()
        self.name = ""
        self.version = ""
        
    }
    
    override func setEntity(mobj:NSManagedObject) -> Bool{
        var result:Bool = super.setEntity(mobj)
        if false == result {
            return false;
        }

        self.name = mobj.valueForKey("name") as String
        self.version = mobj.valueForKey("version") as String
        
        self.isEmpty = false
        return true;
    }
    
    override func copyEntity(lxbaseEntity:LxbaseEntity) {
        super.copyEntity(lxbaseEntity)
        var lxAppInfoEntity:LxAppInfoEntity = lxbaseEntity as LxAppInfoEntity
        self.name = lxAppInfoEntity.name
        self.version = lxAppInfoEntity.version
    }
    
    deinit {
        self.isEmpty = true
        self.name = ""
        self.version = ""
    }
}