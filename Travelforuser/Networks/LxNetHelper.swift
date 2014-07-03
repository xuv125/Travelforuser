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
    func showHUD()
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
    
    /* 网络有无判断 */
    func isExistNet() -> Bool {
        var status = AFNetworkReachabilityManager.sharedManager().reachable
        
        if false == status {
            //自定义view
            if self.delegate {
                self.delegate?.showHUD()
            }
        }
        
        return status
    }
    
    /* GET请求 */
    func GET(strUrl:String, isCheckNet:Bool = true) {
        if true == isCheckNet {
            var isExistNet:Bool = self.isExistNet()
        
            if false == isExistNet {
                return
            }
        }
        
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