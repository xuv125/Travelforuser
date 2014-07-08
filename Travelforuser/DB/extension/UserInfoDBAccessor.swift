//
//  UserInfoDBAccessor.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/08.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

extension LxDBAccessor {
    /* 获取用户信息 */
    func getUserInfo () -> LxUserInfoEntity {
        var request = NSFetchRequest(entityName:"UserInfoEntity")
        request.returnsObjectsAsFaults = false
        
        var entity:LxUserInfoEntity = LxUserInfoEntity()
        
        var err:NSError? = nil
        var results = self.managedObjectContext.executeFetchRequest(request, error:&err)
        if err {
            println("Error LxDBAccessor::getUserInfo:->\(err)")
            return entity
        }
        
        if results.count > 0 {
            var res = results[0] as NSManagedObject
            entity.setEntity(res)
            entity.isEmpty = false
        }
        return entity
    }
    
    /* 设置用户信息 */
    func setUserInfo (entity:LxUserInfoEntity) -> Bool {
        var result:Bool = self.truncateEntity("UserInfoEntity")
        if false == result {
            return false
        }
        
        var mobj:NSManagedObject = entity.getModel(inManagedObjectContext: self.managedObjectContext)
        
        var err:NSError? = nil
        self.managedObjectContext.save(&err)
        if err {
            println("Error LxDBAccessor::setUserInfo:->\(err)")
            return false
        }
        return true
    }
}
