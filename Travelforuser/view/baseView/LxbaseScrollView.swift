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
        
        init() {
            
        }
    }
    
    var arrayList:NSMutableArray = NSMutableArray()
    
    init(frame: CGRect) {
        super.init(frame:frame)
        
        // Initialization code
        //按页滚动，总是一次一个宽度，或一个高度单位的滚动
        self.pagingEnabled = true
        
        self.frame = frame
    }
}
