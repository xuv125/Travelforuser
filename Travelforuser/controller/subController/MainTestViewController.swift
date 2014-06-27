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

}
