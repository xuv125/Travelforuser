//
//  LxAppInfoEntity.swift
//  travelforuser
//
//  Created by 倫星 on 2014/06/24.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import CoreData

class AppInfoEntity: BaseEntity {
    @NSManaged var name:String;
    @NSManaged var version:String;
}