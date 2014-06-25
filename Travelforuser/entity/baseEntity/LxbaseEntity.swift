//
//  lxbaseEntity.swift
//  travelforuser
//
//  Created by 倫星 on 2014/06/24.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

class LxbaseEntity: NSManagedObject {
    var isEmpty: Bool = true
    
    init() {
        self.isEmpty = true
    }
    
    func setEntity(mobj:NSManagedObject) -> Bool{
        if nil == mobj {
            return false;
        }
        self.isEmpty = false
        return true;
    }
    
    func copyEntity(lxbaseEntity:LxbaseEntity) {
        self.isEmpty = lxbaseEntity.isEmpty
    }
    
    deinit {
        self.isEmpty = true
    }
}