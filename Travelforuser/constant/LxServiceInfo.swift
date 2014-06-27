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
let storeName = PROJECT_NAME
//数据文件物理名名定义
let storeFilename = storeName + ".sqlite"

//shared instance定义
//共通逻辑处理:网络有无，app初期化，app信息和用户信息持久化保存
let LxAPPContainerSharedInstance:LxAPPContainer = LxAPPContainer()
//数据操作封装处理
let LxDBAccessorSharedInstance:LxDBAccessor = LxDBAccessor()

//Web 根地址定义
let WebRoot = "http://www.luodansc.com/"
let ServiceUrl = "http://www.luodansc.com/mobile/"

//-------------------mail 定义-------------------------
let to_mail = "XXXXX@qq.com"
let bcc_mail = "xing_lun@hotmail.com"
//-------------------mail 定义-------------------------

//-------------------Servlet 定义-------------------------
let UserRegister = "http://www.luodansc.com/user.php"
let GetUserInfoServlet = "get_user_info_servlet.php"
let SetApnsInfoServlet = "set_apns_info_servlet.php"
let ClearDeviceBadgeServlet = "clear_device_badge_servlet.php"
let RegisterUserServlet = "register_user_servlet.php"
//........add
//-------------------Servlet 定义-------------------------
