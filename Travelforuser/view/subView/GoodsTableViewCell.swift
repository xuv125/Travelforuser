//
//  GoodsTableViewCell.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/09.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

class GoodsTableViewCell: LxbaseTableViewCell {
    
    var name_Label:LxLabel!
    var descriptionx_Label:LxLabel!
    var price_Label:LxLabel!
    
    var goods_img_ImageView:LxImageView!
    
    var lxGoodsInfoEntity:LxGoodsInfoEntity = LxGoodsInfoEntity()
    
    init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        var width_unit:CGFloat = self.frame.width / 32
        var height_unit:CGFloat = self.frame.height / 20
        
        goods_img_ImageView = LxImageView(frame: self.frame)
        self.contentView.addSubview(goods_img_ImageView)
        
        name_Label = LxLabel(frame: CGRectMake(width_unit, height_unit * 14, width_unit * 15, height_unit))
        name_Label.backgroundColor = UIColor.clearColor()
        name_Label.textAlignment = NSTextAlignment.Right
        name_Label.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(name_Label)
        
        descriptionx_Label = LxLabel(frame: CGRectMake(width_unit, height_unit * 16, width_unit * 20, height_unit))
        descriptionx_Label.backgroundColor = UIColor.clearColor()
        descriptionx_Label.textAlignment = NSTextAlignment.Right
        descriptionx_Label.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(descriptionx_Label)
        
        price_Label = LxLabel(frame: CGRectMake(width_unit * 25, height_unit * 16, width_unit * 7, height_unit))
        price_Label.backgroundColor = UIColor.clearColor()
        price_Label.textAlignment = NSTextAlignment.Left
        price_Label.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(price_Label)
    }
    
    func configureCell(entity:LxGoodsInfoEntity!) -> Bool {
        if true == entity.isEmpty {
            return false
        }
        
        self.lxGoodsInfoEntity.copyEntity(entity)
        goods_img_ImageView.GET(self.lxGoodsInfoEntity.goods_img, success:successGetImage, failure:failureGetImage)
        return true
    }
    
    func successGetImage(responseObject:AnyObject!) {
        name_Label.text = self.lxGoodsInfoEntity.name
        descriptionx_Label.text = self.lxGoodsInfoEntity.descriptionx
        price_Label.text = String.stringWithCurrencyStyle(self.lxGoodsInfoEntity.price)
    }
    
    func failureGetImage(error: NSError!) {
        println("GoodsTableViewCell failure: \(error)")
    }
}
