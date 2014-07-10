//
//  LxbaseTableViewCell.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/09.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

class LxbaseTableViewCell: UITableViewCell {
    
    var indexPath: NSIndexPath?

    func configure(frame: CGRect, entity:LxbaseEntity!, atIndexPath indexPath: NSIndexPath) -> Bool {
        self.indexPath = indexPath
        
        self.frame = frame
        
        if true == entity.isEmpty {
            return false
        }
        return true
    }
}
