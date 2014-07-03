//
//  lxAPPContainer.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/06/24.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import Foundation

class LxAPPContainer : NSObject, LxNetHelperDelegate {
    var lxAppInfoEntity:LxAppInfoEntity
    var lxUserInfoEntity:LxUserInfoEntity
    
    init() {
        self.lxAppInfoEntity = LxAppInfoEntity()
        self.lxUserInfoEntity = LxUserInfoEntity()
    }
    
    /* 单例模式 */
    class var sharedInstance : LxAPPContainer {
        return LxAPPContainerSharedInstance
    }
    
    /* 内存保存app信息 */
    func setAppInfoEntity(lxAppInfoEntity:LxAppInfoEntity) {
        self.lxAppInfoEntity.copyEntity(lxAppInfoEntity)
    }
    
    /* 内存保存用户信息 */
    func setUserInfoEntity(lxUserInfoEntity:LxUserInfoEntity) {
        self.lxUserInfoEntity.copyEntity(lxUserInfoEntity)
    }
    
    /* 清空用户信息 */
    func initUserInfoEntity() {
        self.lxUserInfoEntity = LxUserInfoEntity()
    }
    
    /* app初期化 */
    func appInit() {
        //网络是否可用，第一次初始化调用
        LxNetHelperSharedInstance.isExistNet()
        var lxAppInfoEntity:LxAppInfoEntity = LxDBAccessorSharedInstance.getAppInfo()
        var lxUserInfoEntity:LxUserInfoEntity = LxDBAccessorSharedInstance.getUserInfo()
        
        if false == lxAppInfoEntity.isEmpty {
            self.setAppInfoEntity(lxAppInfoEntity)
        }
        
        if false == lxUserInfoEntity.isEmpty {
            self.setUserInfoEntity(lxUserInfoEntity)
            
            //用户自动登录认证
            LxNetHelperSharedInstance.delegate = self
            var strUrl = GetUserInfoAction + "?email=" + lxUserInfoEntity.email + "&password=" + lxUserInfoEntity.password
            LxNetHelperSharedInstance.GET(strUrl, isCheckNet: false)
        }

        var version:String = NSBundle.mainBundle().infoDictionary["CFBundleVersion"] as String
        
        //与当前版本号不同
        if version != self.lxAppInfoEntity.version {
            lxAppInfoEntity.name = PROJECT_NAME
            lxAppInfoEntity.version = version
            
            self.setAppInfoEntity(lxAppInfoEntity)
            
            //Todo清空临时文件
            
            //存入版本信息
            LxDBAccessorSharedInstance.setAppInfo(lxAppInfoEntity)
        }
    }
    
    // #pragma mark - LxNetHelperDelegate
    func success(responseObject:AnyObject!) {
        println("LxAPPContainer:success")

        var responseObj:NSDictionary! = responseObject as NSDictionary
        
        var lxUserInfoEntity:LxUserInfoEntity = LxUserInfoEntity()
        
        lxUserInfoEntity.isEmpty = false
        lxUserInfoEntity.account_id = responseObj.objectForKey("account_id") as String
        lxUserInfoEntity.create_time = responseObj.objectForKey("create_time") as String
        lxUserInfoEntity.email = responseObj.objectForKey("email") as String
        lxUserInfoEntity.golden_coin_id = responseObj.objectForKey("golden_coin_id") as String
        lxUserInfoEntity.golden_coin = responseObj.objectForKey("golden_coin") as Int
        lxUserInfoEntity.last_login_time = responseObj.objectForKey("last_login_time") as String
        lxUserInfoEntity.login_count = responseObj.objectForKey("login_count") as Int
        lxUserInfoEntity.login_time = responseObj.objectForKey("login_time") as String
        lxUserInfoEntity.name_en_family = responseObj.objectForKey("name_en_family") as String
        lxUserInfoEntity.name_en_middle = responseObj.objectForKey("name_en_middle") as String
        lxUserInfoEntity.name_en_last = responseObj.objectForKey("name_en_last") as String
        lxUserInfoEntity.name_kanji_sei = responseObj.objectForKey("name_kanji_sei") as String
        lxUserInfoEntity.name_kanji_mei = responseObj.objectForKey("name_kanji_mei") as String
        lxUserInfoEntity.name_katakana_sei = responseObj.objectForKey("name_katakana_sei") as String
        lxUserInfoEntity.name_katakana_mei = responseObj.objectForKey("name_katakana_mei") as String
        lxUserInfoEntity.password = responseObj.objectForKey("password") as String
        lxUserInfoEntity.shop_id = responseObj.objectForKey("shop_id") as String
        lxUserInfoEntity.silver_coin_id = responseObj.objectForKey("silver_coin_id") as String
        lxUserInfoEntity.silver_coin = responseObj.objectForKey("silver_coin") as Int
        lxUserInfoEntity.status = responseObj.objectForKey("status") as Int
        lxUserInfoEntity.tel = responseObj.objectForKey("tel") as String
        lxUserInfoEntity.update_time = responseObj.objectForKey("update_time") as String
        lxUserInfoEntity.user_id = responseObj.objectForKey("user_id") as String
        
        println(lxUserInfoEntity.toString())
        
        LxDBAccessorSharedInstance.setUserInfo(lxUserInfoEntity)
    }
    
    func failure() {
        println("LxAPPContainer:failure")
    }
    
    func showHUD() {
        println("LxAPPContainer:showHUD")
    }
}