//
//  GoodsAreaTableViewCell.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/10.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

class GoodsAreaTableViewCell: LxbaseTableViewCell {
    
    var goodsAreaScrollView:GoodsAreaScrollView!
    
    override func configure(frame: CGRect, entity:LxbaseEntity!, atIndexPath indexPath: NSIndexPath) -> Bool {
        var result:Bool = super.configure(frame, entity: entity, atIndexPath : indexPath)
        if false == result {
            return false
        }
        
        self.goodsAreaScrollView = GoodsAreaScrollView(frame: frame)
        return true
    }
}
