//
//  LxbaseImageView.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/09.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

class LxbaseImageView: UIImageView {
    
    var placeholderImage:UIImage = UIImage(named:"placeholder-avatar")
    
    init(frame: CGRect) {
        super.init(frame: frame)
        self.image = self.placeholderImage
    }

    /* GET请求 */
    func GET(strUrl:String, success:(responseObject:NSHTTPURLResponse!) -> Void, failure: (error: NSError!) -> Void) {

        var url:NSURL = NSURL(string:strUrl)
        var urlRequest:NSURLRequest = NSURLRequest(URL:url)
        
        self.setImageWithURLRequest(urlRequest, placeholderImage:self.placeholderImage,
            { (request: NSURLRequest!, responseObject:NSHTTPURLResponse!, image:UIImage!) -> Void in
                self.image = image
                self.alpha = 0
                UIView.animateWithDuration(0.2, animations: {
                        self.alpha = 1.0
                    })
                success(responseObject: responseObject)
                
            }, failure: { (request: NSURLRequest!, responseObject:NSHTTPURLResponse!, error: NSError!) -> Void in
                failure(error: error)
            }
        )
    }
    
}
