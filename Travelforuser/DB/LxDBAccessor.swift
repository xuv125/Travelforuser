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
    
    // #pragma mark - DB 操作方法定义 在extension下
}