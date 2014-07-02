//
//  LxNetHelper.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/02.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import Foundation

protocol LxNetHelperDelegate:NSObjectProtocol {
    func success(responseObject:AnyObject!)
    func failure()
//    func addHUDView(HUD:MBProgressHUD!)
}

class LxNetHelper:NSObject {
    
    var delegate:LxNetHelperDelegate?
    
    var lxViewController:LxbaseViewController?
    
    init() {
        AFNetworkReachabilityManager.sharedManager().startMonitoring()
    }
    
    /* 单例模式 */
    class var sharedInstance : LxNetHelper {
        return LxNetHelperSharedInstance
    }
    
    func isExistNet() -> Bool {
        var status = AFNetworkReachabilityManager.sharedManager().reachable
        
        if false == status {
            //自定义view
//            var HUD:MBProgressHUD = MBProgressHUD()
//            self.delegate?.addHUDView(HUD)
//            let img:UIImage = UIImage(named:"nosmoke.png")
//            var imageView:UIImageView = UIImageView(image:img)
//            HUD.customView = imageView
//            
//            
//            // Set custom view mode
//            HUD.mode = MBProgressHUDModeCustomView
//            HUD.delegate = self.lxViewController
//            HUD.labelText = NSLocalizedString("network_conn_failed", comment: "")
//            
//            println("HUD.labelText:" + HUD.labelText)
//            
//            HUD.show(true)
//            HUD.hide(true, afterDelay: 1)
        }
        
        return status
    }
    
    func GET(strUrl:String) {
        var url:NSURL = NSURL(string:strUrl)

        var request:NSURLRequest = NSURLRequest(URL:url, cachePolicy:NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData ,timeoutInterval:TimeOut)
        
        var operation:AFHTTPRequestOperation = AFHTTPRequestOperation(request: request)
        operation.responseSerializer = AFJSONResponseSerializer()

        operation.setCompletionBlockWithSuccess(
            { (operation: AFHTTPRequestOperation!, responseObject:AnyObject!) in
            println("responseObject:\(responseObject)")
            self.delegate?.success(responseObject)
                
        }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
            println("error: \(error)")
            self.delegate?.failure()
        })
        
        operation.start()
    }
    
    deinit {
        AFNetworkReachabilityManager.sharedManager().stopMonitoring()
    }

}