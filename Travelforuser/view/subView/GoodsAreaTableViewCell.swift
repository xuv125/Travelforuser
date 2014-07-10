//
//  GoodsGroupTableViewCell.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/10.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

class GoodsAreaTableViewCell: LxbaseTableViewCell {
    var name_Label:LxLabel!
    var descriptionx_Label:LxLabel!
    
    var goods_img_ImageView:LxImageView!
    
    func configureCell(frame: CGRect, entity:LxGoodsInfoEntity!, atIndexPath indexPath: NSIndexPath) -> Bool {
        self.frame = frame
        
        var width_unit:CGFloat = self.frame.width / 32
        var height_unit:CGFloat = self.frame.height / 20
        
        self.goods_img_ImageView = LxImageView(frame: self.frame)
        self.contentView.addSubview(goods_img_ImageView)
        
        self.name_Label = LxLabel(frame: CGRectMake(width_unit, height_unit * 14, width_unit * 15, height_unit))
        self.name_Label.backgroundColor = UIColor.clearColor()
        self.name_Label.textColor = UIColor.whiteColor()
        self.name_Label.textAlignment = NSTextAlignment.Right
        self.name_Label.font = UIFont.systemFontOfSize(8)
        self.contentView.addSubview(name_Label)
        
        self.descriptionx_Label = LxLabel(frame: CGRectMake(width_unit, height_unit * 16, width_unit * 20, height_unit))
        self.descriptionx_Label.backgroundColor = UIColor.clearColor()
        self.descriptionx_Label.textColor = UIColor.whiteColor()
        self.descriptionx_Label.textAlignment = NSTextAlignment.Right
        self.descriptionx_Label.font = UIFont.systemFontOfSize(8)
        self.contentView.addSubview(descriptionx_Label)
        
        if true == entity.isEmpty {
            return false
        }
        
//        self.lxGoodsInfoEntity.copyEntity(entity)
//        self.goods_img_ImageView.GET(GoodsImgUrl + self.lxGoodsInfoEntity.goods_img, success:successGetImage, failure:failureGetImage)
        return true
    }
}
