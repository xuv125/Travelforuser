//
//  LxbaseScrollView.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/09.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

class LxbaseScrollView: UIScrollView {
    
    class Contents {
        var view:LxbaseView!
        var entity:LxbaseEntity!
    }
    
    var indexPath:NSIndexPath?
    
    var arrayList:NSMutableArray = NSMutableArray()
    
    func configure(frame: CGRect, entityList:NSArray, atIndexPath indexPath: NSIndexPath) -> Bool {
        //按页滚动，总是一次一个宽度，或一个高度单位的滚动
        self.pagingEnabled = true
        
        self.indexPath = indexPath
        
        self.frame = frame
        
        if entityList.count < 1 {
            return false
        }
        
        for item:AnyObject in entityList {
            var contents:Contents = Contents()
            contents.entity = item as LxbaseEntity
            self.arrayList.addObject(contents)
        }
        
        return true
    }
}
