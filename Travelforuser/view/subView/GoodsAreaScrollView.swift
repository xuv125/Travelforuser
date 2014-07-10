//
//  GoodsAreaScrollView.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/10.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

class GoodsAreaScrollView: LxbaseScrollView {
    
    override func configure(frame: CGRect, entityList:NSArray, atIndexPath indexPath: NSIndexPath) -> Bool {
        var result:Bool = super.configure(frame, entityList: entityList, atIndexPath : indexPath)
        if false == result {
            return false
        }
        
        for item:AnyObject in self.arrayList {
            var contents:Contents = item as Contents
            var entity:LxbaseEntity = contents.entity as LxbaseEntity
            
            var goodsAreaView:GoodsAreaView = GoodsAreaView(frame:frame)
            goodsAreaView.configure(frame, entity:entity, atIndexPath: indexPath)
            
            contents.view = goodsAreaView
        }
        return true
    }
}
