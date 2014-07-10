//
//  GoodsAreaView.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/10.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

class GoodsAreaView: LxbaseView {
    var name_Label:LxLabel!
    var descriptionx_Label:LxLabel!
    
    var goods_img_ImageView:LxImageView!
    
    var lxGoodsInfoEntity:LxGoodsInfoEntity = LxGoodsInfoEntity()
    
    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
    }
    
    override func configure(frame: CGRect, entity:LxbaseEntity!, atIndexPath indexPath: NSIndexPath) -> Bool {
        var result:Bool = super.configure(frame, entity: entity, atIndexPath : indexPath)
        if false == result {
            return false
        }
        
        var width_unit:CGFloat = self.frame.width / 32
        var height_unit:CGFloat = self.frame.height / 20
        
        self.goods_img_ImageView = LxImageView(frame: self.frame)
        self.addSubview(goods_img_ImageView)
        
        self.name_Label = LxLabel(frame: CGRectMake(width_unit, height_unit * 14, width_unit * 15, height_unit))
        self.name_Label.backgroundColor = UIColor.clearColor()
        self.name_Label.textColor = UIColor.whiteColor()
        self.name_Label.textAlignment = NSTextAlignment.Right
        self.name_Label.font = UIFont.systemFontOfSize(8)
        self.addSubview(name_Label)
        
        self.descriptionx_Label = LxLabel(frame: CGRectMake(width_unit, height_unit * 16, width_unit * 20, height_unit))
        self.descriptionx_Label.backgroundColor = UIColor.clearColor()
        self.descriptionx_Label.textColor = UIColor.whiteColor()
        self.descriptionx_Label.textAlignment = NSTextAlignment.Right
        self.descriptionx_Label.font = UIFont.systemFontOfSize(8)
        self.addSubview(descriptionx_Label)
        
        if true == entity.isEmpty {
            return false
        }
        
        self.lxGoodsInfoEntity.copyEntity(entity)
        self.goods_img_ImageView.GET(GoodsImgUrl + self.lxGoodsInfoEntity.goods_img, success:successGetImage, failure:failureGetImage)
        return true
    }
    
    func successGetImage(responseObject:AnyObject!) {
        self.name_Label.text = self.lxGoodsInfoEntity.name
        self.descriptionx_Label.text = self.lxGoodsInfoEntity.descriptionx
    }
    
    func failureGetImage(error: NSError!) {
        println("GoodsAreaView failure: \(error)")
    }
}
