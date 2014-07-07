//
//  lxbaseEntity.swift
//  travelforuser
//
//  Created by 倫星 on 2014/06/24.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

class LxbaseEntity: NSObject {
    var isEmpty: Bool = true
    
    init() {
        self.isEmpty = true
    }
    
    func setEntity(mobj:NSManagedObject) -> Bool {
        if nil == mobj {
            return false
        }
        self.isEmpty = false
        return true
    }
    
    func getModel(inManagedObjectContext context: NSManagedObjectContext!) -> NSManagedObject{
        return NSManagedObject()
    }
    
    func initFormMap(map:NSDictionary!) {
    }
    
    func copyEntity(baseEntity:LxbaseEntity) {
        self.isEmpty = baseEntity.isEmpty
    }
    
    func toString() -> String {
        var str = ""
        str += "isEmpty:\(self.isEmpty)" + "\n"
        return str
    }
    
    deinit {
        self.isEmpty = true
    }
}