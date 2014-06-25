//
//  LxDBAccessor.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/06/24.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit
import CoreData

let LxDBAccessorSharedInstance:LxDBAccessor = LxDBAccessor()

class LxDBAccessor : NSObject {
    
    var managedObjectContext:NSManagedObjectContext
    
    init() {
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        self.managedObjectContext = appDel.cdh.managedObjectContext
    }

    /* 单例模式 */
    class var sharedInstance : LxAPPContainer {
        return LxAPPContainerSharedInstance
    }
    
    /* entity是否为空判断 */
    func isEmpty(entityName:String) -> Bool {
        var request = NSFetchRequest(entityName:entityName)
        request.includesPropertyValues = false
        
        var err:NSError? = nil
        var dataArray = self.managedObjectContext.executeFetchRequest(request, error:&err)
        
        if err {
            println("Error LxDBAccessor::isEmpty for entity:" + entityName + "->\(err)")
            return false
        }

        if dataArray.isEmpty {
            return true
        }
        
        return false
    }
    
    /* entity清空 */
    func truncateEntity(entityName:String) -> Bool {
        var isEmpty:Bool = self.isEmpty(entityName)
        
        if true == isEmpty {
            return true
        }
        
        var request = NSFetchRequest(entityName:entityName)
        request.includesPropertyValues = false
        
        var err:NSError? = nil
        var dataArray = self.managedObjectContext.executeFetchRequest(request, error:&err)
        
        if err {
            println("Error LxDBAccessor::truncateEntity for entity:" + entityName + "->\(err)")
            return false
        }
        
        for data:AnyObject in dataArray {
            self.managedObjectContext.deleteObject(data as NSManagedObject)
        }
        
        self.managedObjectContext.save(&err)
        if err {
            println("Error LxDBAccessor::truncateEntity for entity:" + entityName + "->\(err)")
            return false
        }
        
        isEmpty = self.isEmpty(entityName)
        
        if true == isEmpty {
            return true
        }
        
        return false
    }
    
    // #pragma mark - DB 操作方法定义
    /* 获取app信息 */
    func getAppInfo () -> LxAppInfoEntity {
        var request = NSFetchRequest(entityName:"LxAppInfoEntity")
        request.returnsObjectsAsFaults = false
//        request.predicate = NSPredicate(format:"username = %@", "")
        
        var results = self.managedObjectContext.executeFetchRequest(request, error:nil)
        
        var lxAppInfoEntity:LxAppInfoEntity = LxAppInfoEntity()
        if results.count > 0 {
            var res = results[0] as NSManagedObject
            lxAppInfoEntity.setEntity(res)
            lxAppInfoEntity.isEmpty = false
        }
        return lxAppInfoEntity
    }

    /* 设置app信息 */
    func setAppInfo (lxAppInfoEntity:LxAppInfoEntity) -> Bool {
        var result:Bool = self.truncateEntity("LxAppInfoEntity")
        if false == result {
            return false
        }
        
        var entity = NSEntityDescription.insertNewObjectForEntityForName("LxAppInfoEntity", inManagedObjectContext:self.managedObjectContext) as LxAppInfoEntity
        entity.copyEntity(lxAppInfoEntity)
        
        var err:NSError? = nil
        self.managedObjectContext.save(&err)
        if err {
            println("Error LxDBAccessor::setAppInfo:->\(err)")
            return false
        }
        return true
    }
    
    /* 获取用户信息 */
    func getUserInfo () -> LxUserInfoEntity {
        var request = NSFetchRequest(entityName:"LxUserInfoEntity")
        request.returnsObjectsAsFaults = false
        
        var lxUserInfoEntity:LxUserInfoEntity = LxUserInfoEntity()
        
        var err:NSError? = nil
        var results = self.managedObjectContext.executeFetchRequest(request, error:&err)
        if err {
            println("Error LxDBAccessor::setAppInfo:->\(err)")
            return lxUserInfoEntity;
        }
        
        if results.count > 0 {
            var res = results[0] as NSManagedObject
            lxUserInfoEntity.setEntity(res)
            lxUserInfoEntity.isEmpty = false
        }
        return lxUserInfoEntity
    }
    
    /* 设置用户信息 */
    func setUserInfo (lxUserInfoEntity:LxUserInfoEntity) -> Bool {
        var result:Bool = self.truncateEntity("LxUserInfoEntity")
        if false == result {
            return false
        }
        
        var entity = NSEntityDescription.insertNewObjectForEntityForName("LxUserInfoEntity", inManagedObjectContext:self.managedObjectContext) as LxUserInfoEntity
        entity.copyEntity(lxUserInfoEntity)
        
        var err:NSError? = nil
        self.managedObjectContext.save(&err)
        if err {
            println("Error LxDBAccessor::setAppInfo:->\(err)")
            return false
        }
        return true
    }
}