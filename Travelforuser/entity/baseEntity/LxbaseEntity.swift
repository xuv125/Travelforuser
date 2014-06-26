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
    
    func setEntity(baseEntity:BaseEntity) -> Bool {
        if nil == baseEntity {
            return false;
        }
        self.isEmpty = false
        return true;
    }
    
    func getModel(inManagedObjectContext context: NSManagedObjectContext!) -> BaseEntity{
        return BaseEntity();
    }
    
    func copyEntity(lxbaseEntity:LxbaseEntity) {
        self.isEmpty = lxbaseEntity.isEmpty
    }
    
    deinit {
        self.isEmpty = true
    }
}