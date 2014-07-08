//
//  LxbaseCollectionViewCell.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/08.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

class LxbaseCollectionViewCell: UICollectionViewCell {

    @IBOutlet var photoImageView : UIImageView
    
//    init(coder aDecoder: NSCoder!) {
//        super.init(coder: aDecoder)
//    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        self.photoImageView.image = nil
    }
}
