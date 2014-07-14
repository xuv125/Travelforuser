//
//  GoodsAreaScrollView.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/10.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

class GoodsAreaScrollView: LxbaseScrollView {
    
    init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = UIColor.grayColor()
        
        // Initialization code
        var strUrl = GetAreaListAction + "?language_id=" + LanguageCode + "&level=1"
        LxNetHelperSharedInstance.GET(strUrl, success: successAreaList, failure: failureAreaList, isCheckNet: false)
    }
    
    // #pragma mark - LxNetHelperDelegate
    func successAreaList(responseObject:AnyObject!) {
        
        self.arrayList.removeAllObjects()
        
        println(self.bounds.width)
        println(self.bounds.height)
        
        println(self.frame.width)
        println(self.frame.height)
        
        var json:NSArray = responseObject as NSArray
        
        var inde:Int = 0
        for item:AnyObject in json {
            var contents:Contents = Contents()
            
            var nsdic:NSDictionary! = item as NSDictionary
            var entity:LxAreaInfoEntity = LxAreaInfoEntity()
            entity.initFormMap(nsdic)
            
            println(entity.toString())
            
            contents.entity = entity as LxbaseEntity
            
            var frame:CGRect = CGRectMake(CGFloat(self.bounds.width) * CGFloat(inde), 0, self.bounds.width, self.bounds.height)
            inde++
            
            contents.view = GoodsAreaView(frame: frame)
            
            contents.view.configure(entity)
            
            self.arrayList.addObject(contents)
            
            self.addSubview(contents.view)
        }
        
        //高度上与 ScrollView 相同，只在横向扩展，所以只要在横向上滚动
        self.contentSize = CGSizeMake(self.bounds.width * CGFloat(self.arrayList.count), self.bounds.height)
        
        //用它指定 ScrollView 中内容的当前位置，即相对于 ScrollView 的左上顶点的偏移
        self.contentOffset = CGPointMake(self.bounds.width, 0)
        
    }
    
    func failureAreaList(error: NSError!) {
        println("GoodsAreaScrollView failure: \(error)")
    }
}
