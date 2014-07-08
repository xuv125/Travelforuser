//
//  GoodsInfoDBAccessor.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/08.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

extension LxDBAccessor {
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
