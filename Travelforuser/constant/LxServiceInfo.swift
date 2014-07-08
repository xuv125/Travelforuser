//
//  lxServiceInfo.swift
//  travelforuser
//
//  Created by 倫星 on 2014/06/20.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

//-------------------沙盒路径定义-------------------------
let PROJECT_NAME:String = NSBundle.mainBundle().infoDictionary["CFBundleName"] as String
let DOCUMENTS_FOLDER = NSHomeDirectory().stringByAppendingString("/Documents")
let DOCUMENTS_COVER = NSHomeDirectory().stringByAppendingString("/Documents/Cover")
//-------------------沙盒路径定义-------------------------

//-------------------获取设备大小-------------------------
//NavBar高度
let NavigationBar_HEIGHT = 44
//获取屏幕 宽度、高度
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
//-------------------获取设备大小-------------------------

//工程名定义
let storeName:String = PROJECT_NAME
//数据文件物理名名定义
let storeFilename:String = storeName + ".sqlite"

//设备语言code
let LanguageCode:String = NSLocale.currentLocale().objectForKey(NSLocaleLanguageCode) as String

//shared instance定义
//共通逻辑处理:网络有无，app初期化，app信息和用户信息持久化保存
let LxAPPContainerSharedInstance:LxAPPContainer = LxAPPContainer()
//数据操作封装处理
let LxDBAccessorSharedInstance:LxDBAccessor = LxDBAccessor()
//网络操作封装
let LxNetHelperSharedInstance:LxNetHelper = LxNetHelper()

let TimeOut:NSTimeInterval = 10.0

//Web 根地址定义
let WebRoot = "http://localhost:8080/pirateAllianceWeb/"
let ServiceUrl = "http://localhost:8080/pirateAllianceWeb/"

//-------------------mail 定义-------------------------
let to_mail = "XXXXX@qq.com"
let bcc_mail = "xing_lun@hotmail.com"
//-------------------mail 定义-------------------------

//http://localhost:8080/pirateAllianceWeb/com/getGoodsInfoList.action?language_id=en
//http://localhost:8080/pirateAllianceWeb/com/clearDeviceBadge.action?device_token=test1
//http://localhost:8080/pirateAllianceWeb/com/userLogin.action?email=xing_lun@hotmail.com&password=12345678
//-------------------Servlet 定义-------------------------
let UserRegisterAction = ServiceUrl + "com/userRegister.action"
let GetUserInfoAction = ServiceUrl + "com/userLogin.action"
let GetGoodsInfoAction = ServiceUrl + "com/getGoodsInfoList.action"
let SetApnsInfoAction = ServiceUrl + "com/setApnsInfo.action"
let ClearDeviceBadgeAction = ServiceUrl + "com/clearDeviceBadge.action"
//........add
//-------------------Servlet 定义-------------------------
