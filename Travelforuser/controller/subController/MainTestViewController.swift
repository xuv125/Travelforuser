//
//  MainTestViewController.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/06/26.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

class MainTestViewController: LxbaseViewController {
    
//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    
    @IBOutlet var txtAppName:UITextField!
    @IBOutlet var txtAppVersion:UITextField!
    
    @IBOutlet var txtEmail:UITextField!
    @IBOutlet var txtPassword:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func bSave() {
        var lxAppInfoEntity:LxAppInfoEntity = LxAppInfoEntity()
        
        lxAppInfoEntity.name = "" + txtAppName.text
        lxAppInfoEntity.version = "" + txtAppVersion.text
        
        LxDBAccessorSharedInstance.setAppInfo(lxAppInfoEntity)
    }
    
    @IBAction func bLoad() {
        var lxAppInfoEntity:LxAppInfoEntity = LxDBAccessorSharedInstance.getAppInfo()
        
        txtAppName.text = lxAppInfoEntity.name
        txtAppVersion.text = lxAppInfoEntity.version
    }
    
    @IBAction func bLogin() {
//        var lxUserInfoEntity1:LxUserInfoEntity = LxDBAccessorSharedInstance.getUserInfo()
//        
//        println("################################")
//        println(lxUserInfoEntity1.toString())
//        println("################################")
//        
        
        let manager = AFHTTPRequestOperationManager()

        let paras :Dictionary = [
            "email"     : txtEmail.text,
            "password"  : txtPassword.text,
        ]
        
        manager.GET(GetUserInfoAction, parameters: paras,
            success: { (operation: AFHTTPRequestOperation!, responseObject:AnyObject!) in
                println("response: \(responseObject)")
                
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
                
            }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                println("error: \(error)")
            })
    }

}
