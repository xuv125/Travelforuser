//
//  AppInfoDBAccessor.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/08.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

extension LxDBAccessor {
    /* 获取app信息 */
    func getAppInfo () -> LxAppInfoEntity {
        var request = NSFetchRequest(entityName:"AppInfoEntity")
        request.returnsObjectsAsFaults = false
        //        request.predicate = NSPredicate(format:"username = %@", "")
        
        var entity:LxAppInfoEntity = LxAppInfoEntity()
        var err:NSError? = nil
        var results = self.managedObjectContext.executeFetchRequest(request, error:&err)
        if err {
            println("Error LxDBAccessor::getAppInfo:->\(err)")
            return entity
        }
        
        if results.count > 0 {
            var res = results[0]  as NSManagedObject
            entity.setEntity(res)
            entity.isEmpty = false
        }
        return entity
    }
    
    /* 设置app信息 */
    func setAppInfo (entity:LxAppInfoEntity) -> Bool {
        var result:Bool = self.truncateEntity("AppInfoEntity")
        if false == result {
            return false
        }
        
        var mobj:NSManagedObject = entity.getModel(inManagedObjectContext: self.managedObjectContext)
        
        var err:NSError? = nil
        self.managedObjectContext.save(&err)
        if err {
            println("Error LxDBAccessor::setAppInfo:->\(err)")
            return false
        }
        return true
    }
}