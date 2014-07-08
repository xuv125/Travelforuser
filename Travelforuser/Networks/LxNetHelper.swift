//
//  LxNetHelper.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/02.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import Foundation

protocol LxNetHelperDelegate:NSObjectProtocol {
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
    func GET(strUrl:String, success:(responseObject:AnyObject!) -> Void, failure: (error: NSError!) -> Void, isCheckNet:Bool = true) {
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
            success(responseObject: responseObject)
        }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
            failure(error: error)
        })
        
        operation.start()
    }
    
    deinit {
        AFNetworkReachabilityManager.sharedManager().stopMonitoring()
    }

}