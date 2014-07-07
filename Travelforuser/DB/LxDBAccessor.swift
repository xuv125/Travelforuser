//
//  LxDBAccessor.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/06/24.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit
import CoreData

class LxDBAccessor : NSObject {
    
    var managedObjectContext:NSManagedObjectContext
    
    init() {
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        self.managedObjectContext = appDel.cdh.managedObjectContext
    }

//    class func shareInstance() -> LxDBAccessor{
//        
//        struct YRLxDBAccessor {
//            static var predicate:dispatch_once_t = 0
//            static var instance:LxDBAccessor? = nil
//        }
//        
//        dispatch_once(&YRLxDBAccessor.predicate,{
//                YRLxDBAccessor.instance=LxDBAccessor()
//            }
//        )
//        return YRLxDBAccessor.instance!
//    }

    /* 单例模式 */
    class var sharedInstance : LxDBAccessor {
        return LxDBAccessorSharedInstance
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
    
    /* 获取本地商品列表 */
    func getGoodsInfoList () -> AnyObject[]! {
        var request = NSFetchRequest(entityName:"GoodsInfoEntity")
        request.returnsObjectsAsFaults = false
        
        var entityList:AnyObject[] = AnyObject[]()
        var entity:LxGoodsInfoEntity = LxGoodsInfoEntity()
        
        var err:NSError? = nil
        var results = self.managedObjectContext.executeFetchRequest(request, error:&err)
        if err {
            println("Error LxDBAccessor::getGoodsInfoList:->\(err)")
            return entityList
        }
        
        for resultItem : AnyObject in results {
            entity.setEntity(resultItem as NSManagedObject)
            entity.isEmpty = false
            
            entityList += entity
        }
        return entityList
    }
    
    /* 保存商品到本地 */
    func addGoods (entity:LxGoodsInfoEntity) -> Bool {
        
        var mobj:NSManagedObject = entity.getModel(inManagedObjectContext: self.managedObjectContext)
        
        var err:NSError? = nil
        self.managedObjectContext.save(&err)
        if err {
            println("Error LxDBAccessor::addGoods:->\(err)")
            return false
        }
        return true
    }
    
    /* 同步服务器商品列表到本地 */
    func refreshGoodsInfoList (array:AnyObject[]!) -> Bool {

        for entity : AnyObject in array {
            var result = self.addGoods(entity as LxGoodsInfoEntity)
            if false == result {
                println("Error LxDBAccessor::refreshGoodsInfoList:")
                return false;
            }
        }

        return true
    }
    

}