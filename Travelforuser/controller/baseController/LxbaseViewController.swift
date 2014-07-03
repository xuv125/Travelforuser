//
//  LxbaseViewController.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/06/25.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit
import MessageUi

class LxbaseViewController: UIViewController,MFMailComposeViewControllerDelegate, MBProgressHUDDelegate, LxNetHelperDelegate {

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
    
    // #pragma mark - LxNetHelperDelegate
    func success(responseObject:AnyObject!) {
        println("LxbaseViewController:success")
    }
    
    func failure() {
        println("LxbaseViewController:failure")
    }
    
    func showHUD() {
        self.addHUDView("network_conn_failed", imgName:"nosmoke.png")
    }

    // #pragma mark - MBProgressHUDDelegate
    func addHUDView(message:String, imgName:String) {
        //自定义view
        var HUD:MBProgressHUD = MBProgressHUD()
        self.view.addSubview(HUD)
        let img:UIImage = UIImage(named:imgName)
        var imageView:UIImageView = UIImageView(image:img)
        HUD.customView = imageView
        
        
        // Set custom view mode
        HUD.mode = MBProgressHUDModeCustomView
        HUD.delegate = self
        HUD.labelText = NSLocalizedString(message, comment: "")
        
        println("HUD.labelText:" + HUD.labelText)
        
        HUD.show(true)
        HUD.hide(true, afterDelay: 1)
    }
}
