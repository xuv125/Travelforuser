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
//        println("LanguageCode:" + LanguageCode)
        
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
        
        lxUserInfoEntity.initFormMap(responseObj)
        
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